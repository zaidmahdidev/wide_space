import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

// import '../injection_container.dart';
import '../injection_container.dart';
import 'constants.dart';
import 'data_providers/local_data_provider.dart';
// import 'data_providers/local_data_provider.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff438099);
  static const Color darkPrimaryColor = Color(0xffe3e3e3);

  static const Color secondaryColor = Color(0xffD9D9D9);
  static const Color darkSecondaryColor = Color(0xff335060);

  // colors
  static const Color ghostWhite = Color(0xfff9f9f9);
  static const Color lightGrey = Color(0xffC9C9C9);
  static const Color darkGrey = Color(0xff4c4c4c);
  static const Color lightYellow = Color(0xffFBE2C6);
  static const Color yellow = Color(0xffEF952E);
  static const Color green = Color(0xff40916c);
  static const Color darkGreen = Color(0xff2d6a4f);
  static const Color blueGreen = Color(0xff438099);
  static const Color blue = Color(0xff3E92CC);
  static const Color darkBlue = Color(0xff486581);
  static const Color red = Color(0xffD8315B);
  static const Color darkRed = Color(0xffAA2C4B);
  static const Color bronze = Color(0xffCD7F32);
  static const Color silver = Color(0xffC0C0C0);
  static const Color gold = Color(0xffFFCA4B);

  // info
  static Color logoColor = blueGreen;
  static Color alertBackgroundColor = lightYellow;
  static Color alertColor = yellow;
  static Color successColor = green;
  static Color darkSuccessColor = darkGreen;
  static Color errorColor = const Color(0xffB00020);
  static Color errorDarkColor = const Color(0xffCF6679);
  static Color info = blue;
  static Color darkInfo = darkBlue;

  // prizes colors
  static Color level_1 = blue;
  static Color level_2 = darkBlue;
  static Color level_3 = green;
  static Color level_4 = darkGreen;
  static Color level_5 = red;
  static Color level_6 = darkRed;
  static Color level_7 = bronze;
  static Color level_8 = silver;
  static Color level_9 = gold;
  static Color level_10 = Colors.black;

  static Color scaffoldBackgroundColor = ghostWhite;
  static Color darkScaffoldBackgroundColor = const Color(0xff121212);

  static Color cardsColor = Colors.white;
  static Color darkCardsColor = const Color(0xff1e1e1e);

  static const String fontFamily = 'Baloo_Bhaijaan_2';
  static const TextTheme textTheme = TextTheme(
    displaySmall:
        TextStyle(fontSize: 39.8, fontFamily: fontFamily, height: 1.75),
    headlineLarge:
        TextStyle(fontSize: 33.2, fontFamily: fontFamily, height: 1.75),
    headlineMedium:
        TextStyle(fontSize: 27.6, fontFamily: fontFamily, height: 1.75),
    headlineSmall:
        TextStyle(fontSize: 23.0, fontFamily: fontFamily, height: 1.75),
    titleLarge: TextStyle(
        fontSize: 23.0,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        height: 1.75),
    titleMedium: TextStyle(
        fontSize: 19.2,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        height: 1.75),
    titleSmall: TextStyle(fontSize: 19.2, fontFamily: fontFamily, height: 1.75),
    bodyLarge: TextStyle(
        fontSize: 16.0,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        height: 1.75),
    bodyMedium: TextStyle(fontSize: 16.0, fontFamily: fontFamily, height: 1.75),
    bodySmall: TextStyle(
        fontSize: 13.3,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        height: 1.75),
    labelLarge: TextStyle(fontSize: 13.3, fontFamily: fontFamily, height: 1.75),
    labelMedium: TextStyle(fontSize: 9.3, fontFamily: fontFamily, height: 1.75),
    labelSmall: TextStyle(fontSize: 8.0, fontFamily: fontFamily, height: 1.75),
  );

  static final AppBarTheme appBarTheme = AppBarTheme(
      iconTheme: const IconThemeData(color: primaryColor),
      // toolbarTextStyle: textTheme.titleLarge!.copyWith(color: primaryColor),
      titleTextStyle: textTheme.titleLarge?.copyWith(color: primaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0.0);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: Colors.black12,
    toggleableActiveColor: AppTheme.blue,
    shadowColor: Colors.black12,
    inputDecorationTheme: InputDecorationTheme(
        errorStyle:
            AppTheme.textTheme.bodyMedium!.copyWith(color: AppTheme.errorColor),
        fillColor: primaryColor),
    colorScheme: ColorScheme.light(
        primary: primaryColor,
        error: errorColor,
        surface: cardsColor,
        secondary: secondaryColor),
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryColor),
    dialogTheme: DialogTheme(
      titleTextStyle: textTheme.titleLarge!.copyWith(color: primaryColor),
      backgroundColor: ghostWhite,
    ),
    brightness: Brightness.light,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(AppTheme.textTheme.titleLarge!
            .copyWith(color: AppTheme.primaryColor)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textTheme,
    shadowColor: Colors.black,
    toggleableActiveColor: AppTheme.darkBlue,
    inputDecorationTheme: InputDecorationTheme(
        errorStyle: AppTheme.textTheme.bodyMedium!
            .copyWith(color: AppTheme.errorDarkColor),
        fillColor: Colors.white),
    colorScheme: ColorScheme.dark(
        primary: darkPrimaryColor,
        error: errorDarkColor,
        surface: darkCardsColor,
        secondary: darkSecondaryColor),
    appBarTheme: appBarTheme.copyWith(
      titleTextStyle: textTheme.titleLarge?.copyWith(color: darkPrimaryColor),
      iconTheme: const IconThemeData(color: darkPrimaryColor),
    ),
    dividerColor: Colors.white54,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: darkPrimaryColor, foregroundColor: Colors.black54),
    dialogTheme: DialogTheme(
      titleTextStyle:
          textTheme.titleLarge!.copyWith(color: primaryColor.withOpacity(0.7)),
      backgroundColor: darkCardsColor,
    ),
    brightness: Brightness.dark,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(AppTheme.textTheme.titleLarge!
            .copyWith(color: AppTheme.darkPrimaryColor)),
      ),
    ),
  );
  static LocalDataProvider cacheAgent = sl.get<LocalDataProvider>();

  static void saveThemeData(bool isDarkMode) async {
    await cacheAgent.addToSingleValueCacheData(
        boxName: isDarkModeKey, data: isDarkMode);
  }

  static bool isDarkMode() {
    return cacheAgent.getSingleValueCachedData(boxName: isDarkModeKey) ??
        (SchedulerBinding.instance.window.platformBrightness ==
            Brightness.dark);
  }

  static void changeTheme(bool isDarkMode) {
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    saveThemeData(isDarkMode);
  }

  static ThemeMode getThemeMode() {
    return isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }
}
