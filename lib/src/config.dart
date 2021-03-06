import 'dart:io';
import 'package:angel_configuration/angel_configuration.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_jael/angel_jael.dart';
import 'package:file/file.dart';
import 'orm.dart' as orm;

AngelConfigurer configureServer(FileSystem fs) {
  return (Angel app) async {
    app.container.registerSingleton<FileSystem>(fs);

    // Loads app configuration from 'config/'.
    // It supports loading from YAML files, and also supports loading a `.env` file.
    //
    // https://github.com/angel-dart/configuration
    await app.configure(configuration(fs));

    // All loaded configuration will be added to `app.configuration`.
    app.logger.config('Loaded configuration: ${app.configuration}');

    // Connect to PostgreSQL.
    await app.configure(orm.configureServer);

    // Configure our application to render HTML templates using Jael,
    // a templating engine that supports expression literals, loops,
    // conditionals, and more.
    //
    // https://github.com/angel-dart/jael
    await app.configure(jael(fs.directory('views')));

    // Enable GZIP and DEFLATE compression (conserves bandwidth)
    app.encoders.addAll({
      'gzip': gzip.encoder,
      'deflate': zlib.encoder,
    });

    // If the user's JWT is expired, the server will reject their request,
    // as it rightfully should.
    //
    // In such a case, let's just delete the user's `token` cookie, and send them back home.
    var oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) {
      if (e.statusCode == 401 && req.accepts('text/html', strict: true)) {
        res
          ..cookies.add(new Cookie('token', '')
            ..path = '/'
            ..maxAge = -1
            ..expires = new DateTime.now().subtract(const Duration(days: 365)))
          ..redirect('/');
      } else {
        return oldErrorHandler(e, req, res);
      }
    };
  };
}
