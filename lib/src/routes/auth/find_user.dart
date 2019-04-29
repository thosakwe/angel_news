import 'dart:async';
import 'package:angel_orm/angel_orm.dart';
import 'package:hn/src/models/models.dart';

Future<User> findUser(String username, QueryExecutor executor) async {
  // * Create a query that searches for a user with the given username.
  var query = UserQuery()..where.username.equals(username);
  return await query.getOne(executor);
}
