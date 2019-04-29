import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_paginate/angel_paginate.dart';
import 'package:hn/src/models/models.dart';
import 'package:pooled_map/pooled_map.dart';

Future<void> configureServer(Angel app) async {
  var executor = app.container.make<QueryExecutor>();

  app.get('/post/int:id', (req, res) async {
    var id = req.params['id'] as int;
    var query = PostQuery()..where.id.equals(id);
    var post = await query.getOne(executor);
    if (post == null) throw AngelHttpException.notFound();

    await res.render('post', {
      'title': post.title,
      'post': post,
    });
  });

  app.get(
      '/',
      showPostList(
        null,
        (req, query) {
          filterTopPosts(query);
        },
      ));

  app.get(
      '/new',
      showPostList(
        'New Links',
        (req, query) {
          query.orderBy(PostFields.createdAt, descending: true);
        },
      ));

  app.get(
      '/show',
      showPostList(
        'Show',
        queryByType(PostType.showAN),
      ));

  app.get(
      '/ask',
      showPostList(
        'Ask',
        queryByType(PostType.askAN),
      ));
}

FutureOr<void> Function(RequestContext, PostQuery) queryByType(PostType type) {
  return (req, query) {
    filterTopPosts(query);
    query.where.type.equals(type);
  };
}

void filterTopPosts(PostQuery query) {
  query.orderBy(PostFields.karma, descending: true);
}

int sortTopPosts(Post a, Post b) {
  return b.karma.compareTo(a.karma);
}

RequestHandler showPostList(
    String title, FutureOr<void> Function(RequestContext, PostQuery) queryFn) {
  return (req, res) async {
    var executor = req.container.make<QueryExecutor>();
    var query = PostQuery();
    var itemsPerPage =
        int.tryParse(req.queryParameters['items_per_page'].toString()) ?? 30;
    var page = int.tryParse(req.queryParameters['page'].toString()) ?? 1;
    await queryFn(req, query);
    var posts = await query.get(executor);
    await res.render('posts', {'title': title, 'paginator': posts});
  };
}
