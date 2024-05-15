import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:student_portal_app/core/network/end_point.dart';
import 'package:student_portal_app/features/login/data/repository/login_repo.dart';
import 'package:student_portal_app/features/login/persentation/management/bloc/user_bloc.dart';
import 'applocalizations/applpcalizations.dart';
import 'core/utils/theme/themes.dart';
import 'features/home/management/home/home_cubit.dart';
import 'features/home/management/home/home_state.dart';
import 'features/splash/presentation/page/splash_screen.dart';
import 'injection_container.dart' as di;


class MyApp extends StatelessWidget {

  MyApp({Key? key ,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        // BlocProvider<LoginCubit>(
        //     create: (_) => di.sl.get<LoginCubit>()),
        BlocProvider(
          create: (context) => UserBloc(loginRepository: LoginRepository()),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return  MaterialApp(
            themeMode:  HomeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            // themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            theme: lightTheme,
            title: 'بوابة الطالب الجامعي',

            // locale: Locale(HomeCubit.get(context).language),
            locale: const Locale('ar'),
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            // locale: const Locale('ar'),
            // locale: Get.deviceLocale,
            // translations: MyLocal(),


            debugShowCheckedModeBanner: false,
            // home: BlocBuilder<InternetCubit,InternetState>(
            //   builder: (context, state) => !IS_CONNECTED? const Splash_Screen():const Scaffold(body: Center(child: Text('no Internet '),)),
            // ),
            home: const SplashScreen(),
            // home: IS_CONNECTED? Splash_Screen():Scaffold()
          );
        },
      ),
    );
  }
}