import 'package:angel_migration/angel_migration.dart';
import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'package:timeago/timeago.dart';
part 'models.g.dart';

@serializable
@orm
abstract class _User extends Model {
  String get username;

  String get password;

  String get salt;

  int get karma;
}

@serializable
@orm
abstract class _Comment extends Model {
  int get postId;

  int get parentId;

  String get text;

  int get karma;

  @belongsTo
  _User get user;
}

enum PostType { normal, askAN, showAN }

@serializable
@orm
abstract class _Post extends Model {
  PostType get type;

  String get title;

  String get link;

  String get text;

  int get karma;

  @belongsTo
  _User get user;

  String get linkTo => isLink ? link : '/post/$id';

  bool get isLink => link?.isNotEmpty == true;

  String get hostname => Uri.parse(link).host;

  String get fuzzyTime => timeAgo(createdAt.toLocal());

  @hasMany
  List<_Comment> get comments;
}

enum VoteType { upvote, downvote }

@serializable
@orm
abstract class _Vote extends Model {
  int get userId;

  VoteType get type;

  int get postId;

  int get commentId;
}
