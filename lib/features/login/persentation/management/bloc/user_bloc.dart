import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_portal_app/features/login/data/model/login_model.dart';
import 'package:student_portal_app/features/login/data/repository/login_repo.dart';

import '../../../../../core/errors/failures.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoginRepository loginRepository;
  UserBloc({required this.loginRepository}) : super(UserInitial()) {
    on<UserEvent>(_onUserEvent);
  }

  void _onUserEvent(UserEvent event, Emitter<UserState> emit) async {
    if(event is LoginEvent){
      emit(LoginLoadingDataState());
      final failureOrData = await loginRepository.sendLoginRequest(
        email: event.email,
        password: event.password,
      );

      failureOrData.fold(
            (failure) {
          emit(LoginErrorDataState(error: mapFailureToMessage(failure)));
        },
            (data) {
          emit(LoginSuccessDataState(loginModel: data));
        },
      );
    }

    if(event is SignUpEvent){
      emit(LoginLoadingDataState());
      final failureOrData = await loginRepository.sendSignUpRequest(
        email: event.email,
        password: event.password,
        phonenumber: event.phonNumber,
        username: event.username
      );

      failureOrData.fold(
            (failure) {
          emit(SignUpErrorDataState(error: mapFailureToMessage(failure)));
        },
            (data) {
          emit(SignUpSuccessDataState(loginModel: data));
        },
      );
    }
  }

}
