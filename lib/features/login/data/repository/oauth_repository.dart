import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:oauth_dio/oauth_dio.dart';

class OAuthRepository extends OAuthStorage {
  static final Box box = Hive.box('AUTH_CACHE_BOX');
  static const String key = 'oauth';

  static bool get isExists => box.containsKey(key);

  @override
  Future<OAuthToken?> fetch() async {
    var token = await box.get(key);
    return token != null ? OAuthToken.fromMap(json.decode(token)) : null;
  }

  OAuthToken? fetchImmediately() {
    var token = box.get(key);
    return token != null ? OAuthToken.fromMap(json.decode(token)) : null;
  }

  @override
  Future<OAuthToken> save(OAuthToken token) async {
    await box.put(key, json.encode(token.toMap()));
    return token;
  }

  @override
  Future<void> clear() async {
    await box.delete(key);
  }
}
