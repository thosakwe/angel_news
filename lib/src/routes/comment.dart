import 'dart:async';
import 'package:angel_auth/angel_auth.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_validate/server.dart';
import 'package:hn/src/models/models.dart';

void configureServer(Angel app) {
  var validator = new Validator({
    requireField(CommentFields.text): isNonEmptyString,
  });
}
