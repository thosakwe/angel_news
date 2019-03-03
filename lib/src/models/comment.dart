import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'user.dart';
part 'comment.g.dart';

@serializable
@orm
abstract class _Comment extends Model {
  int get userId;

  int get postId;

  int get parentId;

  String get text;

  int get karma;

  @belongsTo
  User get user;
}
