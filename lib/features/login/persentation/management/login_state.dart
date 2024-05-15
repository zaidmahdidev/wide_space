
import 'package:equatable/equatable.dart';

import '../../data/model/login_model.dart';

abstract class LoginState  extends Equatable{}

class LoginInitState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginLoadingDataState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginSuccessDataState extends LoginState{
   final LoginModel loginModel;
  LoginSuccessDataState({required this.loginModel});

  @override
  List<Object?> get props => [loginModel];
}

class LoginErrorDataState extends LoginState{
  final String error;
  LoginErrorDataState({required this.error});

  @override
  List<Object?> get props => [error];
}





class SignUpSuccessDataState extends LoginState{
   final LoginModel loginModel;
  SignUpSuccessDataState({required this.loginModel});

  @override
  List<Object?> get props => [loginModel];
}

class SignUpErrorDataState extends LoginState{
  final String error;
  SignUpErrorDataState({required this.error});

  @override
  List<Object?> get props => [error];
}