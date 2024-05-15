import 'package:equatable/equatable.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../applocalizations/applpcalizations.dart';


abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnexpectedFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ExpireFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UserExistsFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ConnectionFailure extends Failure {
  @override
  List<Object> get props => [];
}

class InvalidFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UniqueFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ReceiveFailure extends Failure {
  @override
  List<Object> get props => [];
}

class PasswordFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UnauthenticatedFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CustomFailure extends Failure {
  final String message;

  const CustomFailure({required this.message});

  @override
  List<Object> get props => [];
}

class BlockedFailure extends Failure {
  @override
  List<Object> get props => [];
}

// String mapFailureToMessage(Failure failure) {
//   switch (failure.runtimeType) {
//     case ServerFailure:
//       return AppLocalizations.of(Get.context!)!.serverFailure;
//     case EmptyCacheFailure:
//       return AppLocalizations.of(Get.context!)!.cacheFailure;
//     case ConnectionFailure:
//       return AppLocalizations.of(Get.context!)!.connectionFailure;
//     case NotFoundFailure:
//       return AppLocalizations.of(Get.context!)!.notFoundFailure;
//     case InvalidFailure:
//       return AppLocalizations.of(Get.context!)!.invalidFailure;
//     case ExpireFailure:
//       return AppLocalizations.of(Get.context!)!.expireFailure;
//     case UserExistsFailure:
//       return AppLocalizations.of(Get.context!)!.userExistsFailure;
//     case UniqueFailure:
//       return AppLocalizations.of(Get.context!)!.uniqueFailure;
//     case PasswordFailure:
//       return AppLocalizations.of(Get.context!)!.passwordFailure;
//     case ReceiveFailure:
//       return AppLocalizations.of(Get.context!)!.receiveFailure;
//     case UnauthenticatedFailure:
//       showFlushBar(
//         AppLocalizations.of(Get.context!)!.unauthenticatedFailure,
//         context: Get.context!,
//       );
//       Future.delayed(const Duration(seconds: 3), () async {
//         await logout(redirect: true);
//       });
//       return AppLocalizations.of(Get.context!)!.unauthenticatedFailure;
//     case BlockedFailure:
//       return AppLocalizations.of(Get.context!)!.blockedFailure;
//     case UnexpectedFailure:
//       return AppLocalizations.of(Get.context!)!.unexpectedFailure;
//     case CustomFailure:
//       return (failure as CustomFailure).message;
//     default:
//       return AppLocalizations.of(Get.context!)!.unexpectedFailure;
//   }
// }
