import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'vote.g.dart';

enum VoteType { upvote, downvote }

@serializable
@orm
abstract class _Vote extends Model {
  int get userId;

  VoteType get type;

  String get postId;

  String get commentId;
}
