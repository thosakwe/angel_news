// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class PostQuery extends Query<Post, PostQueryWhere> {
  PostQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = PostQueryWhere(this);
  }

  @override
  final PostQueryValues values = PostQueryValues();

  PostQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'posts';
  }

  @override
  get fields {
    return const ['id', 'user_id', 'type', 'title', 'link', 'text', 'karma'];
  }

  @override
  PostQueryWhere get where {
    return _where;
  }

  @override
  PostQueryWhere newWhereClause() {
    return PostQueryWhere(this);
  }

  static Post parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Post(
        id: row[0].toString(),
        userId: (row[1] as String),
        type: PostType.values[(row[2] as int)],
        title: (row[3] as String),
        link: (row[4] as String),
        text: (row[5] as String),
        karma: (row[6] as int));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class PostQueryWhere extends QueryWhere {
  PostQueryWhere(PostQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        userId = StringSqlExpressionBuilder(query, 'user_id'),
        type =
            EnumSqlExpressionBuilder<PostType>(query, 'type', (v) => v.index),
        title = StringSqlExpressionBuilder(query, 'title'),
        link = StringSqlExpressionBuilder(query, 'link'),
        text = StringSqlExpressionBuilder(query, 'text'),
        karma = NumericSqlExpressionBuilder<int>(query, 'karma');

  final NumericSqlExpressionBuilder<int> id;

  final StringSqlExpressionBuilder userId;

  final EnumSqlExpressionBuilder<PostType> type;

  final StringSqlExpressionBuilder title;

  final StringSqlExpressionBuilder link;

  final StringSqlExpressionBuilder text;

  final NumericSqlExpressionBuilder<int> karma;

  @override
  get expressionBuilders {
    return [id, userId, type, title, link, text, karma];
  }
}

class PostQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  int get id {
    return (values['id'] as int);
  }

  set id(int value) => values['id'] = value;
  String get userId {
    return (values['user_id'] as String);
  }

  set userId(String value) => values['user_id'] = value;
  PostType get type {
    return PostType.values[(values['type'] as int)];
  }

  set type(PostType value) => values['type'] = value.index;
  String get title {
    return (values['title'] as String);
  }

  set title(String value) => values['title'] = value;
  String get link {
    return (values['link'] as String);
  }

  set link(String value) => values['link'] = value;
  String get text {
    return (values['text'] as String);
  }

  set text(String value) => values['text'] = value;
  int get karma {
    return (values['karma'] as int);
  }

  set karma(int value) => values['karma'] = value;
  void copyFrom(Post model) {
    userId = model.userId;
    type = model.type;
    title = model.title;
    link = model.link;
    text = model.text;
    karma = model.karma;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Post extends _Post {
  Post(
      {this.id,
      this.userId,
      this.type,
      this.title,
      this.link,
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
  final PostType type;

  @override
  final String title;

  @override
  final String link;

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

  Post copyWith(
      {String id,
      String userId,
      PostType type,
      String title,
      String link,
      String text,
      int karma,
      dynamic user,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Post(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        title: title ?? this.title,
        link: link ?? this.link,
        text: text ?? this.text,
        karma: karma ?? this.karma,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Post &&
        other.id == id &&
        other.userId == userId &&
        other.type == type &&
        other.title == title &&
        other.link == link &&
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
      type,
      title,
      link,
      text,
      karma,
      user,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return PostSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

abstract class PostSerializer {
  static Post fromMap(Map map) {
    return new Post(
        id: map['id'] as String,
        userId: map['user_id'] as String,
        type: map['type'] is PostType
            ? (map['type'] as PostType)
            : (map['type'] is int ? PostType.values[map['type'] as int] : null),
        title: map['title'] as String,
        link: map['link'] as String,
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

  static Map<String, dynamic> toMap(_Post model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'user_id': model.userId,
      'type': model.type == null ? null : PostType.values.indexOf(model.type),
      'title': model.title,
      'link': model.link,
      'text': model.text,
      'karma': model.karma,
      'user': model.user,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class PostFields {
  static const List<String> allFields = <String>[
    id,
    userId,
    type,
    title,
    link,
    text,
    karma,
    user,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String userId = 'user_id';

  static const String type = 'type';

  static const String title = 'title';

  static const String link = 'link';

  static const String text = 'text';

  static const String karma = 'karma';

  static const String user = 'user';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
