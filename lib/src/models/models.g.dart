// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class UserMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('users', (table) {
      table.serial('id')..primaryKey();
      table.varChar('username');
      table.varChar('password');
      table.varChar('salt');
      table.integer('karma');
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('users');
  }
}

class CommentMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('comments', (table) {
      table.serial('id')..primaryKey();
      table.integer('post_id');
      table.integer('parent_id');
      table.varChar('text');
      table.integer('karma');
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('user_id').references('users', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('comments');
  }
}

class PostMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('posts', (table) {
      table.serial('id')..primaryKey();
      table.integer('type');
      table.varChar('title');
      table.varChar('link');
      table.varChar('text');
      table.integer('karma');
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('user_id').references('users', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('posts', cascade: true);
  }
}

class VoteMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('votes', (table) {
      table.serial('id')..primaryKey();
      table.integer('user_id');
      table.integer('type');
      table.integer('post_id');
      table.integer('comment_id');
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

class UserQuery extends Query<User, UserQueryWhere> {
  UserQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = UserQueryWhere(this);
  }

  @override
  final UserQueryValues values = UserQueryValues();

  UserQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'users';
  }

  @override
  get fields {
    return const [
      'id',
      'username',
      'password',
      'salt',
      'karma',
      'created_at',
      'updated_at'
    ];
  }

  @override
  UserQueryWhere get where {
    return _where;
  }

  @override
  UserQueryWhere newWhereClause() {
    return UserQueryWhere(this);
  }

  static User parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = User(
        id: row[0].toString(),
        username: (row[1] as String),
        password: (row[2] as String),
        salt: (row[3] as String),
        karma: (row[4] as int),
        createdAt: (row[5] as DateTime),
        updatedAt: (row[6] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class UserQueryWhere extends QueryWhere {
  UserQueryWhere(UserQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        username = StringSqlExpressionBuilder(query, 'username'),
        password = StringSqlExpressionBuilder(query, 'password'),
        salt = StringSqlExpressionBuilder(query, 'salt'),
        karma = NumericSqlExpressionBuilder<int>(query, 'karma'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final StringSqlExpressionBuilder username;

  final StringSqlExpressionBuilder password;

  final StringSqlExpressionBuilder salt;

  final NumericSqlExpressionBuilder<int> karma;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, username, password, salt, karma, createdAt, updatedAt];
  }
}

class UserQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  String get username {
    return (values['username'] as String);
  }

  set username(String value) => values['username'] = value;
  String get password {
    return (values['password'] as String);
  }

  set password(String value) => values['password'] = value;
  String get salt {
    return (values['salt'] as String);
  }

  set salt(String value) => values['salt'] = value;
  int get karma {
    return (values['karma'] as int);
  }

  set karma(int value) => values['karma'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(User model) {
    username = model.username;
    password = model.password;
    salt = model.salt;
    karma = model.karma;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

class CommentQuery extends Query<Comment, CommentQueryWhere> {
  CommentQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = CommentQueryWhere(this);
    leftJoin('users', 'user_id', 'id',
        additionalFields: const [
          'id',
          'username',
          'password',
          'salt',
          'karma',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
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
    return const [
      'id',
      'post_id',
      'parent_id',
      'text',
      'karma',
      'user_id',
      'created_at',
      'updated_at'
    ];
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
        postId: (row[1] as int),
        parentId: (row[2] as int),
        text: (row[3] as String),
        karma: (row[4] as int),
        createdAt: (row[6] as DateTime),
        updatedAt: (row[7] as DateTime));
    if (row.length > 8) {
      model = model.copyWith(
          user: UserQuery.parseRow(row.skip(8).take(7).toList()));
    }
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
        postId = NumericSqlExpressionBuilder<int>(query, 'post_id'),
        parentId = NumericSqlExpressionBuilder<int>(query, 'parent_id'),
        text = StringSqlExpressionBuilder(query, 'text'),
        karma = NumericSqlExpressionBuilder<int>(query, 'karma'),
        userId = NumericSqlExpressionBuilder<int>(query, 'user_id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final NumericSqlExpressionBuilder<int> postId;

  final NumericSqlExpressionBuilder<int> parentId;

  final StringSqlExpressionBuilder text;

  final NumericSqlExpressionBuilder<int> karma;

  final NumericSqlExpressionBuilder<int> userId;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, postId, parentId, text, karma, userId, createdAt, updatedAt];
  }
}

class CommentQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
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
  int get userId {
    return (values['user_id'] as int);
  }

  set userId(int value) => values['user_id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(Comment model) {
    postId = model.postId;
    parentId = model.parentId;
    text = model.text;
    karma = model.karma;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    if (model.user != null) {
      values['user_id'] = model.user.id;
    }
  }
}

class PostQuery extends Query<Post, PostQueryWhere> {
  PostQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = PostQueryWhere(this);
    leftJoin('users', 'user_id', 'id',
        additionalFields: const [
          'id',
          'username',
          'password',
          'salt',
          'karma',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
    leftJoin(CommentQuery(trampoline: trampoline), 'id', 'post_id',
        additionalFields: const [
          'id',
          'post_id',
          'parent_id',
          'text',
          'karma',
          'user_id',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
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
    return const [
      'id',
      'type',
      'title',
      'link',
      'text',
      'karma',
      'user_id',
      'created_at',
      'updated_at'
    ];
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
        type: row[1] == null ? null : PostType.values[(row[1] as int)],
        title: (row[2] as String),
        link: (row[3] as String),
        text: (row[4] as String),
        karma: (row[5] as int),
        createdAt: (row[7] as DateTime),
        updatedAt: (row[8] as DateTime));
    if (row.length > 9) {
      model = model.copyWith(
          user: UserQuery.parseRow(row.skip(9).take(7).toList()));
    }
    if (row.length > 16) {
      model = model.copyWith(
          comments: [CommentQuery.parseRow(row.skip(16).take(8).toList())]
              .where((x) => x != null)
              .toList());
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  @override
  get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<Post>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                comments: List<_Comment>.from(l.comments ?? [])
                  ..addAll(model.comments ?? []));
        }
      });
    });
  }

  @override
  update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<Post>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                comments: List<_Comment>.from(l.comments ?? [])
                  ..addAll(model.comments ?? []));
        }
      });
    });
  }

  @override
  delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<Post>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                comments: List<_Comment>.from(l.comments ?? [])
                  ..addAll(model.comments ?? []));
        }
      });
    });
  }
}

class PostQueryWhere extends QueryWhere {
  PostQueryWhere(PostQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        type =
            EnumSqlExpressionBuilder<PostType>(query, 'type', (v) => v.index),
        title = StringSqlExpressionBuilder(query, 'title'),
        link = StringSqlExpressionBuilder(query, 'link'),
        text = StringSqlExpressionBuilder(query, 'text'),
        karma = NumericSqlExpressionBuilder<int>(query, 'karma'),
        userId = NumericSqlExpressionBuilder<int>(query, 'user_id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final EnumSqlExpressionBuilder<PostType> type;

  final StringSqlExpressionBuilder title;

  final StringSqlExpressionBuilder link;

  final StringSqlExpressionBuilder text;

  final NumericSqlExpressionBuilder<int> karma;

  final NumericSqlExpressionBuilder<int> userId;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, type, title, link, text, karma, userId, createdAt, updatedAt];
  }
}

class PostQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  PostType get type {
    return PostType.values[(values['type'] as int)];
  }

  set type(PostType value) => values['type'] = value?.index;
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
  int get userId {
    return (values['user_id'] as int);
  }

  set userId(int value) => values['user_id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(Post model) {
    type = model.type;
    title = model.title;
    link = model.link;
    text = model.text;
    karma = model.karma;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    if (model.user != null) {
      values['user_id'] = model.user.id;
    }
  }
}

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
        type: row[2] == null ? null : VoteType.values[(row[2] as int)],
        postId: (row[3] as int),
        commentId: (row[4] as int),
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
        postId = NumericSqlExpressionBuilder<int>(query, 'post_id'),
        commentId = NumericSqlExpressionBuilder<int>(query, 'comment_id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final NumericSqlExpressionBuilder<int> userId;

  final EnumSqlExpressionBuilder<VoteType> type;

  final NumericSqlExpressionBuilder<int> postId;

  final NumericSqlExpressionBuilder<int> commentId;

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

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  int get userId {
    return (values['user_id'] as int);
  }

  set userId(int value) => values['user_id'] = value;
  VoteType get type {
    return VoteType.values[(values['type'] as int)];
  }

  set type(VoteType value) => values['type'] = value?.index;
  int get postId {
    return (values['post_id'] as int);
  }

  set postId(int value) => values['post_id'] = value;
  int get commentId {
    return (values['comment_id'] as int);
  }

  set commentId(int value) => values['comment_id'] = value;
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
class User extends _User {
  User(
      {this.id,
      this.username,
      this.password,
      this.salt,
      this.karma,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String username;

  @override
  final String password;

  @override
  final String salt;

  @override
  final int karma;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  User copyWith(
      {String id,
      String username,
      String password,
      String salt,
      int karma,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        salt: salt ?? this.salt,
        karma: karma ?? this.karma,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _User &&
        other.id == id &&
        other.username == username &&
        other.password == password &&
        other.salt == salt &&
        other.karma == karma &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, username, password, salt, karma, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return UserSerializer.toMap(this);
  }
}

@generatedSerializable
class Comment extends _Comment {
  Comment(
      {this.id,
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
  final int postId;

  @override
  final int parentId;

  @override
  final String text;

  @override
  final int karma;

  @override
  final _User user;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Comment copyWith(
      {String id,
      int postId,
      int parentId,
      String text,
      int karma,
      _User user,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Comment(
        id: id ?? this.id,
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
    return hashObjects(
        [id, postId, parentId, text, karma, user, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return CommentSerializer.toMap(this);
  }
}

@generatedSerializable
class Post extends _Post {
  Post(
      {this.id,
      this.type,
      this.title,
      this.link,
      this.text,
      this.karma,
      this.user,
      List<_Comment> comments,
      this.createdAt,
      this.updatedAt})
      : this.comments = new List.unmodifiable(comments ?? []);

  @override
  final String id;

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
  final _User user;

  @override
  final List<_Comment> comments;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Post copyWith(
      {String id,
      PostType type,
      String title,
      String link,
      String text,
      int karma,
      _User user,
      List<_Comment> comments,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Post(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        link: link ?? this.link,
        text: text ?? this.text,
        karma: karma ?? this.karma,
        user: user ?? this.user,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Post &&
        other.id == id &&
        other.type == type &&
        other.title == title &&
        other.link == link &&
        other.text == text &&
        other.karma == karma &&
        other.user == user &&
        const ListEquality<_Comment>(const DefaultEquality<_Comment>())
            .equals(other.comments, comments) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      type,
      title,
      link,
      text,
      karma,
      user,
      comments,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return PostSerializer.toMap(this);
  }
}

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
  final int postId;

  @override
  final int commentId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Vote copyWith(
      {String id,
      int userId,
      VoteType type,
      int postId,
      int commentId,
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

abstract class UserSerializer {
  static User fromMap(Map map) {
    return new User(
        id: map['id'] as String,
        username: map['username'] as String,
        password: map['password'] as String,
        salt: map['salt'] as String,
        karma: map['karma'] as int,
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

  static Map<String, dynamic> toMap(_User model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'username': model.username,
      'password': model.password,
      'salt': model.salt,
      'karma': model.karma,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserFields {
  static const List<String> allFields = <String>[
    id,
    username,
    password,
    salt,
    karma,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String username = 'username';

  static const String password = 'password';

  static const String salt = 'salt';

  static const String karma = 'karma';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class CommentSerializer {
  static Comment fromMap(Map map) {
    return new Comment(
        id: map['id'] as String,
        postId: map['post_id'] as int,
        parentId: map['parent_id'] as int,
        text: map['text'] as String,
        karma: map['karma'] as int,
        user: map['user'] != null
            ? UserSerializer.fromMap(map['user'] as Map)
            : null,
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
      'post_id': model.postId,
      'parent_id': model.parentId,
      'text': model.text,
      'karma': model.karma,
      'user': UserSerializer.toMap(model.user),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CommentFields {
  static const List<String> allFields = <String>[
    id,
    postId,
    parentId,
    text,
    karma,
    user,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String postId = 'post_id';

  static const String parentId = 'parent_id';

  static const String text = 'text';

  static const String karma = 'karma';

  static const String user = 'user';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class PostSerializer {
  static Post fromMap(Map map) {
    return new Post(
        id: map['id'] as String,
        type: map['type'] is PostType
            ? (map['type'] as PostType)
            : (map['type'] is int ? PostType.values[map['type'] as int] : null),
        title: map['title'] as String,
        link: map['link'] as String,
        text: map['text'] as String,
        karma: map['karma'] as int,
        user: map['user'] != null
            ? UserSerializer.fromMap(map['user'] as Map)
            : null,
        comments: map['comments'] is Iterable
            ? new List.unmodifiable(
                ((map['comments'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(CommentSerializer.fromMap))
            : null,
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
      'type': model.type == null ? null : PostType.values.indexOf(model.type),
      'title': model.title,
      'link': model.link,
      'text': model.text,
      'karma': model.karma,
      'user': UserSerializer.toMap(model.user),
      'comments':
          model.comments?.map((m) => CommentSerializer.toMap(m))?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class PostFields {
  static const List<String> allFields = <String>[
    id,
    type,
    title,
    link,
    text,
    karma,
    user,
    comments,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String type = 'type';

  static const String title = 'title';

  static const String link = 'link';

  static const String text = 'text';

  static const String karma = 'karma';

  static const String user = 'user';

  static const String comments = 'comments';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class VoteSerializer {
  static Vote fromMap(Map map) {
    return new Vote(
        id: map['id'] as String,
        userId: map['user_id'] as int,
        type: map['type'] is VoteType
            ? (map['type'] as VoteType)
            : (map['type'] is int ? VoteType.values[map['type'] as int] : null),
        postId: map['post_id'] as int,
        commentId: map['comment_id'] as int,
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
