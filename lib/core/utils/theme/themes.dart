import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/theme.dart';






ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // secondaryHeaderColor: Colors.black26,
  primarySwatch: Colors.grey,

  // canvasColor: Colors.white12,  // هذا فيه حاجات
  secondaryHeaderColor: Colors.white10,

  appBarTheme:  AppBarTheme(
    toolbarHeight: 80,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
    ),
    // iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      // color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.alexandria().fontFamily,
    ),
  ),
  fontFamily: GoogleFonts.tajawal().fontFamily,

);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  secondaryHeaderColor: MyTheme.primaryColor,
  primarySwatch: primary,
  // secondaryHeaderColor: Colors.black,

  appBarTheme:  AppBarTheme(
    toolbarHeight: 80,
    backgroundColor: MyTheme.primaryColor,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
    ),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      // color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.alexandria().fontFamily,
    ),
  ),



  // fontFamily: 'Jannah'
  // fontFamily: GoogleFonts.notoKufiArabic().fontFamily
  fontFamily: GoogleFonts.tajawal().fontFamily,

);



// ThemeData dartTheme = ThemeData(
//     primarySwatch: Colors.red,
//     scaffoldBackgroundColor: HexColor('0xff9900'),
//     appBarTheme: const AppBarTheme(
//       //backwardsCompatibility: false,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: Colors.orange,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//       backgroundColor: MyColors.orange,
//       elevation: 0.0,
//       titleTextStyle: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//       ),
//       //Icon search color
//       iconTheme: IconThemeData(
//         color: Colors.white,
//       ),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: MyColors.orange,
//       unselectedItemColor: Colors.white70,
//       elevation: 40.0,
//       backgroundColor: MyColors.orange,
//     ),
//     textTheme: const TextTheme(
//       bodyText1: TextStyle(
//         fontSize: 18.0,
//         fontWeight: FontWeight.w600,
//         color: Colors.white,
//       ),
//     ),
//     fontFamily: 'Jannah');
//
// ThemeData ligthTheme = ThemeData(
//     primarySwatch: MyColors.kPrimaryColor,
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: const AppBarTheme(
//       //backwardsCompatibility: false,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: MyColors.kPrimaryColor,
//         statusBarIconBrightness: Brightness.light,
//       ),
//       backgroundColor: MyColors.orange,
//       elevation: 0.0,
//       titleTextStyle: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//       ),
//       //Icon search color
//       iconTheme: IconThemeData(
//         color: Colors.white,
//       ),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: MyColors.white,
//       unselectedItemColor: Colors.black,
//       elevation: 40.0,
//       backgroundColor: MyColors.kPrimaryColor,
//     ),
//     textTheme: const TextTheme(
//       bodyText1: TextStyle(
//         fontSize: 14.0,
//         overflow: TextOverflow.ellipsis,
//         color: Colors.black,
//       ),
//     ),
//     fontFamily: 'Jannah');