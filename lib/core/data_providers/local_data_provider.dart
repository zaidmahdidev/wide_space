import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

import '../../injection_container.dart';

class LocalDataProvider<T> {
  Future<Box<T>> openBox({
    required String boxKey,
    required String boxName,
  }) async {
    logger.t('cacheData Hive');

    return Future.value(const FlutterSecureStorage())
        .then((secureStorage) async {
      /// Create new encryption key if not exists
      if (!await secureStorage.containsKey(key: boxKey)) {
        var key = Hive.generateSecureKey();
        await secureStorage.write(key: boxKey, value: base64UrlEncode(key));
      }
      var secureKey = await secureStorage.read(key: boxKey);
      // Load encryptionKey
      var encryptionKey = base64Url.decode(secureKey!);

      return Hive.openBox<T>(boxName,
          encryptionCipher: HiveAesCipher(encryptionKey));
    });
  }

  Future<void> cacheAllData({
    required Iterable<T> data,
    required String boxName,
  }) async {
    logger.t('cacheData Hive');
    await Hive.box<T>(boxName).addAll(data);
  }

  Future<void> addToCacheData({
    required String boxName,
    required T data,
  }) async {
    logger.t('cacheData Hive');
    await Hive.box<T>(boxName).add(data);
  }

  Future<void> addToSingleValueCacheData({
    required String boxName,
    required T data,
  }) async {
    logger.t('addToSingleValueCacheData Hive');
    await Hive.box<T>(boxName).clear();
    await Hive.box<T>(boxName).add(data);
  }

  Future<void> addKeyValueToCacheData({
    required String boxName,
    required T data,
    required dynamic key,
  }) async {
    logger.t('addToCacheDataWithKey Hive');
    await Hive.box<T>(boxName).put(key, data);
  }

  Future<void> updateKeyValueCacheData({
    required String boxName,
    required T data,
    required dynamic key,
  }) async {
    logger.t('updateKeyValueCacheData Hive');
    await addKeyValueToCacheData(
      boxName: boxName,
      data: data,
      key: key,
    );
  }

  List<dynamic> getCachedData({
    required String boxName,
  }) {
    logger.t('getCachedData Hive');
    logger.t('getCachedData Hive  ${Hive.box<T>(boxName).values.toList()}');
    return Hive.box<T>(boxName).values.toList();
  }

  T? getSingleValueCachedData({
    required String boxName,
  }) {
    logger.d('getSingleValueCachedData $boxName');
    logger.d(Hive.box<T>(boxName).values.toList());
    return Hive.box<T>(boxName).values.toList().isNotEmpty
        ? Hive.box<T>(boxName).values.toList().first
        : null;
  }

  Future<int> clearCache({
    required String boxName,
  }) async {
    logger.t('clearCache Hive');
    return await Hive.box<T>(boxName).clear();
  }

  Future<void> deleteTheKeyData({
    required String boxName,
    required dynamic key,
  }) async {
    logger.t('deleteSingleValueCacheData Hive');
    await Hive.box<T>(boxName).delete(key);
  }

  Future<void> closeHiveBox({
    required String boxName,
  }) async {
    logger.t('closeHiveBox Hive');
    await Hive.box<T>(boxName).close();
  }
}
