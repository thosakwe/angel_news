// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class VoteMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('votes', (table) {
      table.serial('id')..primaryKey();
      table.integer('user_id');
      table.integer('type');
      table.varChar('post_id');
      table.varChar('comment_id');
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('votes');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class VoteQuery extends Query<Vote, VoteQueryWhere> {
  VoteQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = VoteQueryWhere(this);
  }

  @override
  final VoteQueryValues values = VoteQueryValues();

  VoteQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'votes';
  }

  @override
  get fields {
    return const [
      'id',
      'user_id',
      'type',
      'post_id',
      'comment_id',
      'created_at',
      'updated_at'
    ];
  }

  @override
  VoteQueryWhere get where {
    return _where;
  }

  @override
  VoteQueryWhere newWhereClause() {
    return VoteQueryWhere(this);
  }

  static Vote parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Vote(
        id: row[0].toString(),
        userId: (row[1] as int),
        type: VoteType.values[(row[2] as int)],
        postId: (row[3] as String),
        commentId: (row[4] as String),
        createdAt: (row[5] as DateTime),
        updatedAt: (row[6] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class VoteQueryWhere extends QueryWhere {
  VoteQueryWhere(VoteQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        userId = NumericSqlExpressionBuilder<int>(query, 'user_id'),
        type =
            EnumSqlExpressionBuilder<VoteType>(query, 'type', (v) => v.index),
        postId = StringSqlExpressionBuilder(query, 'post_id'),
        commentId = StringSqlExpressionBuilder(query, 'comment_id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final NumericSqlExpressionBuilder<int> userId;

  final EnumSqlExpressionBuilder<VoteType> type;

  final StringSqlExpressionBuilder postId;

  final StringSqlExpressionBuilder commentId;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, userId, type, postId, commentId, createdAt, updatedAt];
  }
}

class VoteQueryValues extends MapQueryValues {
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
  VoteType get type {
    return VoteType.values[(values['type'] as int)];
  }

  set type(VoteType value) => values['type'] = value.index;
  String get postId {
    return (values['post_id'] as String);
  }

  set postId(String value) => values['post_id'] = value;
  String get commentId {
    return (values['comment_id'] as String);
  }

  set commentId(String value) => values['comment_id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(Vote model) {
    userId = model.userId;
    type = model.type;
    postId = model.postId;
    commentId = model.commentId;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

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
  final int userId;

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
      int userId,
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
        userId: map['user_id'] as int,
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
