import 'package:angel_auth/angel_auth.dart';
import 'package:angel_container/angel_container.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:hn/src/models/models.dart';
import 'auth/auth.dart';

Future<void> configureServer(Angel app) async {
  // Grab the JWT secret from the environment.
  var pepper = app.configuration['jwt_secret'] as String;
  var executor = app.container.make<QueryExecutor>();

  // Use `AngelAuth` to manage user authentication.
  var auth = new AngelAuth<User>(
    jwtKey: pepper,
    jwtLifeSpan: const Duration(days: 365).inMilliseconds,
    secureCookies: app.environment.isProduction,
    //cookieDomain: 'localhost:3000',
  );

  // Decode JWT's sent to the server on each request.
  app.fallback(auth.decodeJwt);

  // A function that serializes a user for a JWT.
  auth.serializer = (u) => u.idAsInt;

  // A function that finds the user associated with a JWT.
  auth.deserializer = (id) async {
    var query = UserQuery()..where.id.equals(id as int);
    return await query.getOne(executor);
  };

  // Inject the current user + path into `res.render`, since the user is parsed here.
  app.fallback((req, res) {
    try {
      res.renderParams.addAll({
        'user': req.container.has<User>() ? req.container.make<User>() : null,
        // 'user': await req.container.makeAsync<User>(),
        'path': req.uri.path
      });
    } on ReflectionException {
      // Ignore...
    }
    return true;
  });

  await app.configure(auth.configureServer);

  auth.strategies['local'] = LocalAuthStrategy(
    localAuthVerifier(executor, pepper),
    allowBasic: false,
  );

  app.group('/auth', authRoutes(auth, pepper));
}
