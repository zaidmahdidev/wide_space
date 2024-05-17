part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}


class HomeLoadingDataState extends HomeState{}

class HomeSuccessDataState extends HomeState{
   final HomeModel homeModel;
   const HomeSuccessDataState( {required this.homeModel});
}


class HomeErrorDataState extends HomeState{
   final String error;
   const HomeErrorDataState({required this.error});
}



//////////////////// mode //////////////////

class ChangeModeState extends HomeState{}


//////////////////////////  ChangeLanguage  ////////////////////////

class ChangeLanguageState extends HomeState{
  final String? languageCode;

  ChangeLanguageState({this.languageCode});

}