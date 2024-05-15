class OfflineException implements Exception {}

class ServerException implements Exception {}

class EmptyCacheException implements Exception {}

class EmptyException implements Exception {}

class InvalidException implements Exception {}

class NotFoundException implements Exception {}

class ExpireException implements Exception {}

class UniqueException implements Exception {}

class UserExistsException implements Exception {}

class ReceiveException implements Exception {}

class PasswordException implements Exception {}

class UnexpectedException implements Exception {}

class UnauthenticatedException implements Exception {}

class BlockedException implements Exception {}

class CustomException implements Exception {
  final String message;

  CustomException({required this.message});
}
