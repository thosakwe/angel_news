import 'package:angel_auth/angel_auth.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:hn/src/models/models.dart';
import 'package:uuid/uuid.dart';
import 'auth_callback.dart';
import 'find_user.dart';
import 'hash_user_password.dart';

RequestHandler createAccount(AngelAuth<User> auth, String pepper) {
  // Angel's IoC container will ensure that all these parameters are available at runtime.
  return (req, res) async {
    // Grab the data from the request body.
    var executor = req.container.make<QueryExecutor>();
    var uuid = req.container.make<Uuid>();
    var username = req.bodyAsMap['username'] as String,
        password = req.bodyAsMap['password'] as String;

    // If a user already exists, see if we can just sign them in instead.
    var user = await findUser(username, executor);

    // Find or create a user...
    if (user != null) {
      if (user.password != hashUserPassword(password, user.salt, pepper)) {
        user = null;
      }
    } else {
      // Otherwise, create a new user.
      var salt = uuid.v4();
      var query = UserQuery();
      var now = DateTime.now().toUtc();
      query.values
        ..username = username
        ..salt = salt
        ..password = hashUserPassword(password, salt, pepper)
        ..karma = 0
        ..createdAt = now
        ..updatedAt = now;

      // The user we've created has no ID, because it's purely a Dart object,
      // and doesn't exist in the database.
      //
      // We need to insert it into the database.
      user = await query.insert(executor);
    }

    // Now that we've found or created a user, let's give the user a response.
    if (user != null) {
      // Log the user in; `package:angel_auth` will take care of setting cookies, etc.
      await auth.loginById(user.id, req, res);

      // Next, just call the auth callback, and redirect the user.
      return await authCallback(req, res);
    } else {
      res
        ..statusCode = 401
        ..redirect('/login?bad_signup=1');
    }
  };
}
