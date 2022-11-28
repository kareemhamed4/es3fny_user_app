import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: myFavColor
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: myFavColor,
    ),
    color: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "FinalR",color: myFavColor4),
    bodyText2: TextStyle(fontFamily: "FinalR",color: myFavColor4),
    subtitle1: TextStyle(fontFamily: "FinalB",color: myFavColor4),
    headline5: TextStyle(fontFamily: "FinalR",color: myFavColor4),
    headline6: TextStyle(fontFamily: "FinalBL",color: myFavColor4),
    caption: TextStyle(fontFamily: "FinalB",color: myFavColor2),
    button: const TextStyle(fontFamily: "FinalB",color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontFamily: "KareemB",fontSize: 12),
    unselectedLabelStyle: const TextStyle(fontFamily: "KareemR",fontSize: 12),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: myFavColor4,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: myFavColor
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: myFavColor,
    ),
    color: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "FinalR",color: myFavColor4),
    bodyText2: TextStyle(fontFamily: "FinalR",color: myFavColor4),
    subtitle1: TextStyle(fontFamily: "FinalB",color: myFavColor4),
    headline5: TextStyle(fontFamily: "FinalR",color: myFavColor4),
    headline6: TextStyle(fontFamily: "FinalBL",color: myFavColor4),
    caption: TextStyle(fontFamily: "FinalB",color: myFavColor2),
    button: const TextStyle(fontFamily: "FinalB",color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontFamily: "KareemB",fontSize: 12),
    unselectedLabelStyle: const TextStyle(fontFamily: "KareemR",fontSize: 12),
  ),
);