import '../../data/home_model.dart';


abstract class HomeState {}

class HomeInitState extends HomeState{}

class HomeLoadingDataState extends HomeState{}

class HomeSuccessDataState extends HomeState{
   final HomeModel homeModel;
  HomeSuccessDataState( this.homeModel);
}


class HomeErrorDataState extends HomeState{
   final String error;
  HomeErrorDataState(this.error);
}



//////////////////// mode //////////////////

class ChangeModeState extends HomeState{}


//////////////////////////  ChangeLanguage  ////////////////////////

class ChangeLanguageState extends HomeState{
  final String? languageCode;

  ChangeLanguageState({this.languageCode});

}