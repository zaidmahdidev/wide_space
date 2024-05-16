import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:student_portal_app/features/login/data/model/login_model.dart';
import 'package:student_portal_app/injection_container.dart' as di;

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oauth_dio/oauth_dio.dart';

// import '../../../../core/constants.dart';
import '../../../../core/data_providers/remote_data_provider.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/data_source_url.dart';
import '../../../../core/repository.dart';
import 'oauth_repository.dart';

// import '../models/direction_model.dart';
// import '../models/map_service_points_model.dart';
// import '../models/user_model.dart';
// import 'oauth_repository.dart';

class LoginRepository extends Repository {
  Future<Either<Failure, dynamic>> sendLoginRequest({
    required String email,
    required String password,
  }) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          try {
            if (!OAuthRepository.isExists || password.isNotEmpty) {
              await oAuth.storage.clear();
              await oAuth.requestTokenAndSave(
                PasswordGrant(
                  email: email,
                  password: password,
                ),
              );
            }
            await oAuth.storage.clear();
            await oAuth.requestTokenAndSave(
              PasswordGrant(
                email: email,
                password: password,
              ),
            );
          } on DioException catch (e) {
            if ((e.response!.data is Map) &&
                (e.response!.data as Map).containsKey('errors')) {
              throw CustomException(
                  message: ((e.response!.data['errors'] as Map)[
                          (e.response!.data['errors'] as Map).keys.first]
                      as List)[0]);
            } else {
              throw InvalidException();
            }
          }

          final dynamic remoteData;
          try {
            remoteData = await remoteDataProvider.sendData(
                requestType: RequestTypes.post,
                url: 'https://student.valuxapps.com/api/login',
                cacheKey: 'CACHED_USER',
                returnType: dynamic,
                body: {
                  'email': email,
                  'password': password,
                });
          } on OfflineException catch (e, s) {
            di.logger.d('login catch', error: e, stackTrace: s);
            rethrow;
          }
          return remoteData;
        });
  }

  Future<Either<Failure, dynamic>> sendSignUpRequest(
      {required String username,
      required String email,
      required String phonenumber,
      required String password}) async {
    return await sendRequest(
      checkConnection: networkInfo.isConnected,
      remoteFunction: () async {
        final dynamic remoteData;
        try {
          remoteData = await remoteDataProvider.sendData(
            url: 'https://student.valuxapps.com/api/register',
            retrievedDataType: Data.init(),
            returnType: Map,
            body: {
              'name': username,
              'phone': phonenumber,
              'email': email,
              'password': password,
            },
            cacheKey: 'CACHED_USER',
          );
        } on OfflineException catch (e, s) {
          di.logger.d('signup catch', error: e, stackTrace: s);
          rethrow;
        }

        return remoteData;
      },
    );
  }

  // Future<Either<Failure, dynamic>> sendSignUpRequest(
  //     {required LoginModel user, required String password}) async {
  //   return await sendRequest(
  //     checkConnection: networkInfo.isConnected,
  //     remoteFunction: () async {
  //       final dynamic remoteData;
  //       try {
  //         remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.getSignupEndPoint,
  //           retrievedDataType: LoginModel.init(),
  //           returnType: Map,
  //           body: {
  //         'Message' : user.message,
  //         "Status" : user.status,
  //         "token_type" : user.tokenType,
  //         'access_token' : user.accessToken,
  //         'name' : user.name,
  //         'user status' : user.userStatus,
  //         },
  //           cacheKey: 'CACHED_USER',
  //         );
  //       } on OfflineException catch (e, s) {
  //         di.logger.d('signup catch', error: e, stackTrace: s);
  //         rethrow;
  //       }
  //       return remoteData;
  //     },
  //   );
  // }
  //
  // Future<Either<Failure, dynamic>> getMyInfo() async {
  //   return await sendRequest(
  //     checkConnection: networkInfo.isConnected,
  //     remoteFunction: () async {
  //       final dynamic remoteData;
  //       remoteData = await remoteDataProvider.sendData(
  //         requestType: RequestTypes.get,
  //         url: DataSourceURL.getMyEndPoint,
  //         returnType: Map,
  //         retrievedDataType: LoginModel.init(),
  //         cacheKey: 'CACHED_USER',
  //       );
  //
  //       return remoteData;
  //     },
  //   );
  // }
  //
  // Future<Either<Failure, dynamic>> editMyInfo({required UserModel user}) async {
  //   return await sendRequest(
  //     checkConnection: networkInfo.isConnected,
  //     remoteFunction: () async {
  //       final dynamic remoteData;
  //       try {
  //         remoteData = await remoteDataProvider.sendData(
  //           url: "${DataSourceURL.getMyEndPoint}?_method=PUT",
  //           retrievedDataType: UserModel.init(),
  //           requestType: RequestTypes.post,
  //           returnType: Map,
  //           body: user.toFormData(),
  //         );
  //       } on OfflineException catch (e, s) {
  //         di.logger.d('edit profile catch', error: e, stackTrace: s);
  //         rethrow;
  //       }
  //       return remoteData;
  //     },
  //   );
  // }
  //
  // Future<Either<Failure, dynamic>> getUserInfo({
  //   required int userId,
  // }) async {
  //   return await sendRequest(
  //     checkConnection: networkInfo.isConnected,
  //     remoteFunction: () async {
  //       final dynamic remoteData;
  //       try {
  //         remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.getUserEndPoint(userId: userId),
  //           requestType: RequestTypes.get,
  //           retrievedDataType: UserModel.init(),
  //           returnType: Map,
  //         );
  //       } on OfflineException catch (e, s) {
  //         di.logger.d('get user info catch', error: e, stackTrace: s);
  //         rethrow;
  //       }
  //       return remoteData;
  //     },
  //   );
  // }
  //
  // Future<Either<Failure, dynamic>> changePasswordRequest({
  //   required String oldPassword,
  //   required String newPassword,
  // }) async {
  //   try {
  //     return await sendRequest(
  //       checkConnection: networkInfo.isConnected,
  //       remoteFunction: () async {
  //         final dynamic remoteData;
  //
  //         remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.getChangePasswordPoint,
  //           retrievedDataType: UserModel.init(),
  //           body: {'old': oldPassword, 'new': newPassword},
  //         );
  //         return remoteData;
  //       },
  //     );
  //   } on OfflineException catch (e, s) {
  //     di.logger.d('change password catch', error: e, stackTrace: s);
  //     rethrow;
  //   }
  // }
  //
  // Future<Either<Failure, dynamic>> sendVerifyOTPRequest({
  //   required String otp,
  // }) async {
  //   try {
  //     return await sendRequest(
  //       checkConnection: networkInfo.isConnected,
  //       remoteFunction: () async {
  //         final remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.verifyOTP,
  //           retrievedDataType: UserModel.init(),
  //           body: {
  //             'otp': otp,
  //           },
  //           cacheKey: 'CACHED_USER',
  //         );
  //
  //         return remoteData;
  //       },
  //     );
  //   } on OfflineException catch (e, s) {
  //     di.logger.d('send verify otp catch', error: e, stackTrace: s);
  //     rethrow;
  //   }
  // }
  //
  // Future<Either<Failure, dynamic>> resendOTPRequest() async {
  //   try {
  //     return await sendRequest(
  //       checkConnection: networkInfo.isConnected,
  //       remoteFunction: () async {
  //         final remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.resendOTP,
  //           retrievedDataType: null,
  //           returnType: int,
  //           body: {},
  //         );
  //         return remoteData;
  //       },
  //     );
  //   } on OfflineException catch (e, s) {
  //     di.logger.d('resend otp catch', error: e, stackTrace: s);
  //     rethrow;
  //   }
  // }
  //
  // Future<Either<Failure, dynamic>> forgetPassword({
  //   required String phoneNumber,
  // }) async {
  //   try {
  //     return await sendRequest(
  //       checkConnection: networkInfo.isConnected,
  //       remoteFunction: () async {
  //         final dynamic remoteData;
  //         remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.forgetPassword,
  //           returnType: int,
  //           body: {'phone': phoneNumber},
  //           requestType: RequestTypes.post,
  //         );
  //
  //         return remoteData;
  //       },
  //     );
  //   } on OfflineException catch (e, s) {
  //     di.logger.d('forget password catch', error: e, stackTrace: s);
  //     print({e, s});
  //     rethrow;
  //   }
  // }
  //
  // Future<Either<Failure, dynamic>> resetPassword({
  //   required String phoneNumber,
  //   required String otp,
  //   required String newPassword,
  // }) async {
  //   try {
  //     return await sendRequest(
  //       checkConnection: networkInfo.isConnected,
  //       remoteFunction: () async {
  //         final dynamic remoteData;
  //         remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.forgetPassword,
  //           returnType: int,
  //           body: {
  //             'phone': phoneNumber,
  //             'otp': otp,
  //             'password': newPassword,
  //           },
  //           requestType: RequestTypes.post,
  //         );
  //
  //         return remoteData;
  //       },
  //     );
  //   } on OfflineException catch (e, s) {
  //     di.logger.d('reset password catch', error: e, stackTrace: s);
  //     rethrow;
  //   }
  // }
  //
  // Future<Either<Failure, dynamic>> getServicePoints() async {
  //   try {
  //     return await sendRequest(
  //       checkConnection: networkInfo.isConnected,
  //       remoteFunction: () async {
  //         final dynamic remoteData;
  //         remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.servicePoints,
  //           retrievedDataType: MapServicePoints.init(),
  //           requestType: RequestTypes.get,
  //         );
  //         return remoteData;
  //       },
  //     );
  //   } on OfflineException catch (e, s) {
  //     di.logger.d('get services points catch', error: e, stackTrace: s);
  //     rethrow;
  //   }
  // }
  //
  // Future<Either<Failure, dynamic>> getDirections({
  //   required LatLng origin,
  //   required LatLng destination,
  // }) async {
  //   try {
  //     return await sendRequest(
  //       checkConnection: networkInfo.isConnected,
  //       remoteFunction: () async {
  //         final dynamic remoteData;
  //         remoteData = await remoteDataProvider.sendData(
  //           url: DataSourceURL.googleDirections,
  //           retrievedDataType: DirectionModel.init(),
  //           requestType: RequestTypes.get,
  //           body: {
  //             'origin': '${origin.latitude},${origin.longitude}',
  //             'destination': '${destination.latitude},${destination.longitude}',
  //             'key': googleAPIKey,
  //           },
  //         );
  //         return remoteData;
  //       },
  //     );
  //   } on OfflineException catch (e, s) {
  //     di.logger.d('get directions catch', error: e, stackTrace: s);
  //     rethrow;
  //   }
  // }
}
