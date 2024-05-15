import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as gett;
import 'package:oauth_dio/oauth_dio.dart';

import '../../injection_container.dart' as di;
import '../errors/exceptions.dart';
import 'local_data_provider.dart';

enum RequestTypes { get, post, delete }

class RemoteDataProvider {
  final Dio client;
  final LocalDataProvider cacheAgent;

  RemoteDataProvider({required this.client, required this.cacheAgent});

  Future<dynamic> sendData({
    required String url,
    RequestTypes requestType = RequestTypes.post,
    dynamic body,
    retrievedDataType,
    dynamic returnType,
    String? responseKey,
    String? cacheKey,
  }) async {
    di.logger.d(body.toString());
    di.logger.d(url);
    Response response;
    client.options.headers.addAll({
      'x-locale': gett.Get.locale?.languageCode ??
          gett.Get.deviceLocale?.languageCode ??
          'ar'
    });
    try {
      response = await sendUsing(requestType, url, body);
    } on DioException catch (e) {
      di.logger.d('Dio RemoteDataProvider Error');
      di.logger.d(e.response);
      response = e.response!;
      if (e.response!.statusCode == 419) {
        await di.sl<OAuth>().refreshAccessToken().then((value) async {
          try {
            response = await sendUsing(requestType, url, body);
          } catch (e) {
            di.logger.d(e);
          }
        });
      }
    }
    di.logger.d('response.data');
    di.logger.d(response.data);
    di.logger.d(response.statusCode);
    Map<String, dynamic> map =
    response.data is String ? {"data": response.data} : response.data;
    if ((response.statusCode != 401) &&
        (map['data'] is Map) &&
        (map['data'] as Map).containsKey('errors')) {
      throw CustomException(
          message: ((map['data']['errors']
          as Map)[(map['data']['errors'] as Map).keys.first] as List)[0]);
    }

    try {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 204) {
        if (returnType == List) {
          List<dynamic> data = [];
          if (responseKey != null) {
            data = (map['data'])[responseKey] ?? [];
          } else {
            data = (map['data']?.isEmpty) ?? false ? [] : map['data'] ?? [];
          }

          if (cacheKey != null) {
            di.logger.d(cacheKey);
            di.logger.d(data);
            await cacheAgent.addToSingleValueCacheData(
                boxName: cacheKey, data: jsonEncode(data));
          }
          return retrievedDataType.fromJsonList(data);
        } else if (returnType == int) {
          dynamic data = (map['data']);
          if (responseKey != null) {
            data = (map['data'])[responseKey];
          }
          if (cacheKey != null) {
            di.logger.d(cacheKey);
            di.logger.d(data);
            await cacheAgent.addToSingleValueCacheData(
                boxName: cacheKey, data: jsonEncode(data));
          }
          return data;
        } else if (returnType == String) {
          dynamic data = (map['data']);

          if (data == null || data == '') {
            throw EmptyCacheException();
          }
          if (responseKey != null) {
            data = (map['data'])[responseKey];
          }

          if (cacheKey != null) {
            di.logger.d(cacheKey);
            di.logger.d(data);
            await cacheAgent.addToSingleValueCacheData(
                boxName: cacheKey, data: jsonEncode(data));
          }
          return data;
        } else {
          dynamic data = (map['data']);
          if (responseKey != null) {
            data = (map['data'])[responseKey];
          }
          if (data is List) {
            if (data.isEmpty) {
              throw EmptyException();
            }
          }
          if (cacheKey != null) {
            di.logger.d(cacheKey);
            di.logger.d(data);
            await cacheAgent.addToSingleValueCacheData(
                boxName: cacheKey, data: jsonEncode(data));
          }
          return retrievedDataType.fromJson(data);
        }
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else if (response.statusCode == 404) {
        throw NotFoundException();
      } else if (response.statusCode == 406) {
        throw InvalidException();
      } else if (response.statusCode == 410) {
        throw ExpireException();
      }
      // else if (response.statusCode == 430) {
      //   throw UniqueException();
      // } else if (response.statusCode == 434) {
      //   throw UserExistsException();
      // } else if (response.statusCode == 439) {
      //   throw BlockedException();
      // }
      else if (response.statusCode == 500) {
        throw ServerException();
      }
      // else if (response.statusCode == 555) {
      //   throw ServerException();
      // }
      else if (response.statusCode == 422) {
        log(response.data['errors'].values.first.first);
        throw CustomException(
            message: response.data['errors'].values.first.first);
      } else {
        di.logger.d(response.statusCode);
        throw UnexpectedException();
      }
    } catch (e, s) {
      di.logger.d('remote catch', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<Response<dynamic>> sendUsing(
      RequestTypes requestType, String url, dynamic body) async {
    log("there is exception in send using");
    log("$body is ${body.runtimeType}");
    Response<dynamic> response;
    switch (requestType) {
      case RequestTypes.get:
        response = await client.get(
          url,
          queryParameters: body as Map<String, dynamic>?,
        );
        di.logger.d('Request status is ${response.statusCode}');

        break;
      case RequestTypes.delete:
        response = await client.delete(
          url,
          data: body,
        );
        break;
      default:
        response = await client.post(
          url,
          data: body,
        );
    }
    log("there is no exception in send using");
    return response;
  }
}
