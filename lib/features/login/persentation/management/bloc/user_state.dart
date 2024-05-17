part of 'user_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:student_portal_app/features/login/data/model/login_model.dart';

abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingDataState extends UserState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessDataState extends UserState {
  final LoginModel loginModel;
  LoginSuccessDataState({required this.loginModel});

  @override
  List<Object?> get props => [loginModel];
}

class LoginErrorDataState extends UserState {
  final String error;
  LoginErrorDataState({required this.error});

  @override
  List<Object?> get props => [error];

}

class SignUpSuccessDataState extends UserState {
  final LoginModel loginModel;
  SignUpSuccessDataState({required this.loginModel});

  @override
  List<Object?> get props => [loginModel];
}

class SignUpErrorDataState extends UserState {
  final String error;
  SignUpErrorDataState({required this.error});

  @override
  List<Object?> get props => [error];
}
