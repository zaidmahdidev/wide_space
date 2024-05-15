import 'package:dartz/dartz.dart';
import 'package:student_portal_app/injection_container.dart' as di;
import 'package:oauth_dio/oauth_dio.dart';
import 'data_providers/local_data_provider.dart';
import 'data_providers/remote_data_provider.dart';
import 'errors/exceptions.dart';
import 'errors/failures.dart';
import 'network/network_info.dart';

typedef GetDataFunction = Future<dynamic> Function();
typedef GetCacheDataFunction = dynamic Function();

class Repository {
  final RemoteDataProvider remoteDataProvider = di.sl.get<RemoteDataProvider>();
  final LocalDataProvider localDataProvider = di.sl.get<LocalDataProvider>();
  final NetworkInfo networkInfo = di.sl.get<NetworkInfo>();
  final OAuth oAuth = di.sl.get<OAuth>();

  Future<Either<Failure, dynamic>> sendRequest({
    GetDataFunction? remoteFunction,
    GetCacheDataFunction? getCacheDataFunction,
    required Future<bool> checkConnection,
  }) async {
    if (await checkConnection) {
      try {
        final remoteData = await remoteFunction!();
        return Right(remoteData);
      } on InvalidException {
        return Left(InvalidFailure());
      } on NotFoundException {
        return Left(NotFoundFailure());
      } on UniqueException {
        return Left(UniqueFailure());
      } on ExpireException {
        return Left(ExpireFailure());
      } on UserExistsException {
        return Left(UserExistsFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on ReceiveException {
        return Left(ReceiveFailure());
      } on BlockedException {
        return Left(BlockedFailure());
      } on UnexpectedException {
        return Left(UnexpectedFailure());
      } on UnauthenticatedException {
        return Left(UnauthenticatedFailure());
      } on CustomException catch (customException) {
        return Left(CustomFailure(message: customException.message));
      } catch (e) {
        di.logger.d(e.toString());
        return Left(ServerFailure());
      }
    } else {
      if (getCacheDataFunction == null) {
        return Left(ConnectionFailure());
      }
      try {
        final localData = getCacheDataFunction();
        return Right(localData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      } catch (e, s) {
        di.logger.d("Exception", error: e, stackTrace: s);
        return Left(ServerFailure());
      }
    }
  }
}
