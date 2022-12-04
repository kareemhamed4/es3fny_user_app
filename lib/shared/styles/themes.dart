import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  cardColor: Colors.grey.shade200,
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
    bodyText1: TextStyle(fontFamily: "FinalR",color: myFavColor4,fontSize: 14),
    bodyText2: TextStyle(fontFamily: "FinalB",color: myFavColor4),
    subtitle1: TextStyle(fontFamily: "FinalB",color: myFavColor4),
    headline5: TextStyle(fontFamily: "kareemR",color: myFavColor4),
    headline6: TextStyle(fontFamily: "FinalB",color: myFavColor4),
    caption: TextStyle(fontFamily: "FinalB",color: myFavColor2),
    button: const TextStyle(fontFamily: "FinalB",color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontFamily: "FinalB",fontSize: 12),
    unselectedLabelStyle: const TextStyle(fontFamily: "FinalR",fontSize: 12),
  ),
);

ThemeData darkTheme = ThemeData(
  cardColor: myFavColor10.withOpacity(0.5),
  scaffoldBackgroundColor: myFavColor10,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: myFavColor6
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: myFavColor6,
    ),
    color: myFavColor10,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: myFavColor10,
      statusBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "FinalR",color: myFavColor7,fontSize: 14),
    bodyText2: TextStyle(fontFamily: "FinalB",color: myFavColor7),
    subtitle1: TextStyle(fontFamily: "FinalB",color: myFavColor7),
    headline5: TextStyle(fontFamily: "FinalR",color: myFavColor7),
    headline6: TextStyle(fontFamily: "FinalB",color: myFavColor7),
    caption: TextStyle(fontFamily: "FinalB",color: myFavColor2),
    button: const TextStyle(fontFamily: "FinalB",color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: myFavColor10,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor6),
    unselectedIconTheme: IconThemeData(color: myFavColor2),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontFamily: "FinalB"),
    unselectedItemColor: myFavColor2,
    unselectedLabelStyle: const TextStyle(fontFamily: "FinalR"),
  ),
);