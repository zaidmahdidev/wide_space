
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/network/local/cache_helper.dart';
// import 'home_state.dart';




// class HomeCubit extends Cubit<HomeState> {


//   HomeCubit() : super(HomeInitState());

//   static HomeCubit get(context) => BlocProvider.of(context);



//   // HomeModel? homeModel;

//   bool isDark =  CacheHelper.getData(key: 'isDark') ?? false;


//   void changMode(){
//     isDark = !isDark;
//     CacheHelper.saveData(key: 'isDark', value: isDark );
//    emit(ChangeModeState());

//   }



//   // bool language =  CacheHelper.getData(key: 'lang') ?? 'ar';

//   String language = CacheHelper.getData(key: 'language') ?? 'ar';
//   void changeLanguage(String lang){
//     if (lang == 'en') {
//       language='en';
//       CacheHelper.saveData(key: 'language', value: 'en' );
//       emit(ChangeLanguageState(languageCode: 'en'));
//     } else {
//       language ='ar';
//       CacheHelper.saveData(key: 'language', value: 'ar');
//       emit(ChangeLanguageState(languageCode: 'ar'));


//     }

//   }

// }