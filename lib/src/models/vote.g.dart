// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Vote extends _Vote {
  Vote(
      {this.id,
      this.userId,
      this.type,
      this.postId,
      this.commentId,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String userId;

  @override
  final VoteType type;

  @override
  final String postId;

  @override
  final String commentId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Vote copyWith(
      {String id,
      String userId,
      VoteType type,
      String postId,
      String commentId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Vote(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        postId: postId ?? this.postId,
        commentId: commentId ?? this.commentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Vote &&
        other.id == id &&
        other.userId == userId &&
        other.type == type &&
        other.postId == postId &&
        other.commentId == commentId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, userId, type, postId, commentId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return VoteSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

abstract class VoteSerializer {
  static Vote fromMap(Map map) {
    return new Vote(
        id: map['id'] as String,
        userId: map['user_id'] as String,
        type: map['type'] is VoteType
            ? (map['type'] as VoteType)
            : (map['type'] is int ? VoteType.values[map['type'] as int] : null),
        postId: map['post_id'] as String,
        commentId: map['comment_id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_Vote model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'user_id': model.userId,
      'type': model.type == null ? null : VoteType.values.indexOf(model.type),
      'post_id': model.postId,
      'comment_id': model.commentId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class VoteFields {
  static const List<String> allFields = <String>[
    id,
    userId,
    type,
    postId,
    commentId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String userId = 'user_id';

  static const String type = 'type';

  static const String postId = 'post_id';

  static const String commentId = 'comment_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
