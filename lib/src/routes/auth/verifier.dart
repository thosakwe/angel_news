import 'package:angel_auth/angel_auth.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:hn/src/models/models.dart';
import 'find_user.dart';
import 'hash_user_password.dart';

LocalAuthVerifier<User> localAuthVerifier(QueryExecutor executor, String pepper) {
  return (username, password) async {
    var user = await findUser(username, executor);
    if (user == null) return null;

    // Don't sign a user in, if they have the wrong password, of course.
    if (user.password != hashUserPassword(password, user.salt, pepper))
      return null;

    return user;
  };
}
