// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Comment extends _Comment {
  Comment(
      {this.id,
      this.userId,
      this.postId,
      this.parentId,
      this.text,
      this.karma,
      this.user,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String userId;

  @override
  final String postId;

  @override
  final String parentId;

  @override
  final String text;

  @override
  final int karma;

  @override
  final dynamic user;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Comment copyWith(
      {String id,
      String userId,
      String postId,
      String parentId,
      String text,
      int karma,
      dynamic user,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Comment(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        postId: postId ?? this.postId,
        parentId: parentId ?? this.parentId,
        text: text ?? this.text,
        karma: karma ?? this.karma,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Comment &&
        other.id == id &&
        other.userId == userId &&
        other.postId == postId &&
        other.parentId == parentId &&
        other.text == text &&
        other.karma == karma &&
        other.user == user &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      userId,
      postId,
      parentId,
      text,
      karma,
      user,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return CommentSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

abstract class CommentSerializer {
  static Comment fromMap(Map map) {
    return new Comment(
        id: map['id'] as String,
        userId: map['user_id'] as String,
        postId: map['post_id'] as String,
        parentId: map['parent_id'] as String,
        text: map['text'] as String,
        karma: map['karma'] as int,
        user: map['user'] as dynamic,
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

  static Map<String, dynamic> toMap(_Comment model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'user_id': model.userId,
      'post_id': model.postId,
      'parent_id': model.parentId,
      'text': model.text,
      'karma': model.karma,
      'user': model.user,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CommentFields {
  static const List<String> allFields = <String>[
    id,
    userId,
    postId,
    parentId,
    text,
    karma,
    user,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String userId = 'user_id';

  static const String postId = 'post_id';

  static const String parentId = 'parent_id';

  static const String text = 'text';

  static const String karma = 'karma';

  static const String user = 'user';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
