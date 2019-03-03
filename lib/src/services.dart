import 'package:angel_file_service/angel_file_service.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:file/file.dart';

/// We are abstracting access to our database, using Angel's [Service] API.
///
/// However, Angel News is entirely server-side, and thus we won't be using
/// the REST API functionality that services comes with.
///
/// It's fine for us to just dependency-inject the services we'll need.
class Services {
  final Angel app;
  final FileSystem fs;
  Map<String, HookedService> _cache = {};

  Services(this.app, this.fs) {
    dbDir.createSync(recursive: true);
  }

  Directory get dbDir => fs.directory('.db');

  HookedService get commentService => _findService('comment', 'comments');

  HookedService get postService => _findService('post', 'posts');

  HookedService get userService => _findService('user', 'users');

  HookedService get voteService => _findService('vote', 'votes');

  HookedService _findService(String name, String filename) {
    var key = '${name}Service';
    return _cache.putIfAbsent(key, () {
      var service = new HookedService(
          new JsonFileService(dbDir.childFile('${filename}_db.json')));

      // Insert timestamps upon data entry...
      service
        ..beforeCreated.listen((e) {
          (e.data as Map)['created_at'] = DateTime.now().toUtc();
        })
        ..beforeModify((e) {
          (e.data as Map)['created_at'] = DateTime.now().toUtc();
        });

      return service;
    });
  }
}
