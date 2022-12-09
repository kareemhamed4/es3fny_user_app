import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  cardColor: Colors.grey.shade200,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: myFavColor
  ),
  iconTheme: IconThemeData(
    color: myFavColor,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: myFavColor,
    ),
    color: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "FinalR",color: myFavColor4,fontSize: 14),
    bodyText2: TextStyle(fontFamily: "FinalB",color: myFavColor4),
    subtitle1: TextStyle(fontFamily: "FinalL",color: myFavColor4,fontSize: 16),
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
  cardColor: Colors.grey[400],
  scaffoldBackgroundColor: myFavColor10,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: myFavColor
  ),
  iconTheme: IconThemeData(
    color: myFavColor2,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: myFavColor,
    ),
    color: myFavColor10,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: myFavColor10,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: myFavColor10,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontFamily: "FinalR",color: Colors.white,fontSize: 14),
    bodyText2: TextStyle(fontFamily: "FinalB",color: Colors.white),
    subtitle1: TextStyle(fontFamily: "FinalL",color: Colors.white,fontSize: 16),
    headline5: TextStyle(fontFamily: "FinalR",color: Colors.white),
    headline6: TextStyle(fontFamily: "FinalB",color: Colors.white),
    caption: TextStyle(fontFamily: "FinalB",color: Colors.grey),
    button: TextStyle(fontFamily: "FinalB",color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: myFavColor10,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor),
    unselectedIconTheme: IconThemeData(color: myFavColor2),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontFamily: "FinalB",fontSize: 12),
    unselectedItemColor: myFavColor2,
    unselectedLabelStyle: const TextStyle(fontFamily: "FinalR",fontSize: 12),
  ),
);