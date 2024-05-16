import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:student_portal_app/core/network/local/cache_helper.dart';
import 'package:student_portal_app/core/repository.dart';
import 'package:student_portal_app/injection_container.dart' as di;

import '../../../core/data_providers/remote_data_provider.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';




class HomeRepository  extends Repository{
  Future<Either<Failure, dynamic>> homeData({ required String token}) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          final dynamic remoteData;
          try {
            remoteData = await remoteDataProvider.sendData(
              requestType: RequestTypes.get,
              url: 'https://student.valuxapps.com/api/home',
              // url: DataSourceURL.getPostEndPoint(pageNumber: pageNumber),
              // retrievedDataType: PostModel.init(),
              returnType: Map,
              cacheKey: 'CACHED_HOME',
            );
          } catch (e, s) {
            di.logger.d('Get home catch', error: e, stackTrace: s);
            return throw UnexpectedException();
          }

          return remoteData;
        });
  }
 

  bool isDark =  CacheHelper.getData(key: 'isDark') ?? false;

  void changMode(){
    isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark );
  }
}