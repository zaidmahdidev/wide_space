// import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_portal_app/features/login/data/repository/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginRepository loginRepository;

  void userLogin({
    required String username,
    required String password,
  }) async {
    emit(LoginLoadingDataState());
    final failureOrData = await loginRepository.sendLoginRequest(
        email: username, password: password);
    failureOrData.fold(
      (failure) {
        emit(LoginErrorDataState(error: failureOrData.toString()));
      },
      (data) {
        emit(LoginSuccessDataState(loginModel: data));
      },
    );
  }

  void userSignUp({
    required String username,
    required String email,
    required String phonNumber,
    required String password,
  }) async {
    emit(LoginLoadingDataState());
    final failureOrData = await loginRepository.sendSignUpRequest(
        email: username,
        username: username,
        phonenumber: phonNumber,
        password: password);
    failureOrData.fold(
      (failure) {
        emit(SignUpErrorDataState(error: failureOrData.toString()));
      },
      (data) {
        emit(SignUpSuccessDataState(loginModel: data));
      },
    );
  }
}
