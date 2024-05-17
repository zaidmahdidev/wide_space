part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


class ChangModeEvent extends HomeEvent {}

class GetHomeDataEvent extends HomeEvent {
  final String token;
  const GetHomeDataEvent({required this.token});
}
