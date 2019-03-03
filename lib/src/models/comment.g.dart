// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class CommentQuery extends Query<Comment, CommentQueryWhere> {
  CommentQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = CommentQueryWhere(this);
  }

  @override
  final CommentQueryValues values = CommentQueryValues();

  CommentQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'comments';
  }

  @override
  get fields {
    return const ['id', 'user_id', 'post_id', 'parent_id', 'text', 'karma'];
  }

  @override
  CommentQueryWhere get where {
    return _where;
  }

  @override
  CommentQueryWhere newWhereClause() {
    return CommentQueryWhere(this);
  }

  static Comment parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Comment(
        id: row[0].toString(),
        userId: (row[1] as int),
        postId: (row[2] as int),
        parentId: (row[3] as int),
        text: (row[4] as String),
        karma: (row[5] as int));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class CommentQueryWhere extends QueryWhere {
  CommentQueryWhere(CommentQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        userId = NumericSqlExpressionBuilder<int>(query, 'user_id'),
        postId = NumericSqlExpressionBuilder<int>(query, 'post_id'),
        parentId = NumericSqlExpressionBuilder<int>(query, 'parent_id'),
        text = StringSqlExpressionBuilder(query, 'text'),
        karma = NumericSqlExpressionBuilder<int>(query, 'karma');

  final NumericSqlExpressionBuilder<int> id;

  final NumericSqlExpressionBuilder<int> userId;

  final NumericSqlExpressionBuilder<int> postId;

  final NumericSqlExpressionBuilder<int> parentId;

  final StringSqlExpressionBuilder text;

  final NumericSqlExpressionBuilder<int> karma;

  @override
  get expressionBuilders {
    return [id, userId, postId, parentId, text, karma];
  }
}

class CommentQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  int get id {
    return (values['id'] as int);
  }

  set id(int value) => values['id'] = value;
  int get userId {
    return (values['user_id'] as int);
  }

  set userId(int value) => values['user_id'] = value;
  int get postId {
    return (values['post_id'] as int);
  }

  set postId(int value) => values['post_id'] = value;
  int get parentId {
    return (values['parent_id'] as int);
  }

  set parentId(int value) => values['parent_id'] = value;
  String get text {
    return (values['text'] as String);
  }

  set text(String value) => values['text'] = value;
  int get karma {
    return (values['karma'] as int);
  }

  set karma(int value) => values['karma'] = value;
  void copyFrom(Comment model) {
    userId = model.userId;
    postId = model.postId;
    parentId = model.parentId;
    text = model.text;
    karma = model.karma;
  }
}

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
  final int userId;

  @override
  final int postId;

  @override
  final int parentId;

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
      int userId,
      int postId,
      int parentId,
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
        userId: map['user_id'] as int,
        postId: map['post_id'] as int,
        parentId: map['parent_id'] as int,
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
