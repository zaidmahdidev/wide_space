part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends UserEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends UserEvent {
  final String username;
  final String email;
  final String phonNumber;
  final String password;

  const SignUpEvent(
      {required this.email,
      required this.password,
      required this.phonNumber,
      required this.username});

  @override
  List<Object> get props => [email, password,phonNumber,username];
}
