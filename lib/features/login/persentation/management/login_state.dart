
import 'package:equatable/equatable.dart';

import '../../data/model/login_model.dart';

abstract class LoginState  extends Equatable{}

class LoginInitState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoadingDataState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessDataState extends LoginState{
   final LoginModel loginModel;
  LoginSuccessDataState({required this.loginModel});

  @override
  // TODO: implement props
  List<Object?> get props => [loginModel];
}

class LoginErrorDataState extends LoginState{
  final String error;
  LoginErrorDataState({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}



////////////////////////////////////
class ChangePasswordVisibility extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

