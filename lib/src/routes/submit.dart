import 'dart:async';
import 'package:angel_auth/angel_auth.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_validate/server.dart';
import 'package:hn/src/models/models.dart';
import 'package:canonical_url/canonical_url.dart';

void configureServer(Angel app) {
  var submitValidator = new Validator({
    requireField(PostFields.title): isNonEmptyString,
    PostFields.link: isString,
    PostFields.text: isString,
  });

  app.get(
    '/submit',
    chain([
      requireAuthentication<User>(),
      (req, res) => res.render('submit', {'title': 'Submit'}),
    ]),
  );

  app.post(
    '/submit',
    chain([
      requireAuthentication<User>(),
      validate(submitValidator),
      ioc(submit),
    ]),
  );
}

Future submit(RequestContext req, ResponseContext res, QueryExecutor executor,
    User user) async {
  var canonicalizer = new UrlCanonicalizer(removeFragment: true);
  var rgxAskAN = new RegExp(r'^ask an:');
  var rgxShowAN = new RegExp(r'^show an:');

  var title = req.bodyAsMap[PostFields.title].trim() as String,
      canonicalTitle = title.trim().toLowerCase();
  var link = req.bodyAsMap[PostFields.link]?.trim() as String;
  var text = req.bodyAsMap[PostFields.text]?.trim() as String;

  var type = rgxAskAN.hasMatch(canonicalTitle)
      ? PostType.askAN
      : (rgxShowAN.hasMatch(canonicalTitle)
          ? PostType.showAN
          : PostType.normal);

  if (link?.isNotEmpty != true && text?.isNotEmpty != true) {
    throw new AngelHttpException.badRequest(
        errors: ['Either a link, or a text body is required.']);
  }

  Post post;

  // Make sure no links are repeated.
  if (link?.isNotEmpty == true) {
    var canonicalLink = canonicalizer.canonicalize(link);
    var query = PostQuery()..where.link.equals(canonicalLink);
    var existing = await query.get(executor);

    if (existing.isNotEmpty) {
      post = existing.first;
    } else {
      link = canonicalLink;
    }
  }

  if (post == null) {
    var query = PostQuery();
    var now = DateTime.now().toUtc();
    query.values
      ..userId = user.idAsInt
      ..type = type
      ..title = title
      ..text = text
      ..link = link
      ..karma = 0
      ..createdAt = now
      ..updatedAt = now;

    // Insert the post into the database, and deserialize it.
    post = await query.insert(executor);
  }

  // Take the user to view the post...
  res.redirect('/post/${post.id}');
}
