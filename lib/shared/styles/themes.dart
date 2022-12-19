import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  cardColor: Colors.grey.shade200,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: myFavColor
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: myFavColor
        )
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(
            color: myFavColor.withOpacity(0.5)
        )
    ),
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
  cardColor: myFavColor13,
  scaffoldBackgroundColor: myFavColor14,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: myFavColor11
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: myFavColor10
      )
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(
            color: myFavColor11
        )
    ),
  ),
  iconTheme: IconThemeData(
    color: myFavColor11,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: myFavColor12,
    ),
    color: myFavColor14,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: myFavColor14,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: myFavColor14,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "FinalR",color: myFavColor12,fontSize: 14),
    bodyText2: TextStyle(fontFamily: "FinalB",color: myFavColor12),
    subtitle1: TextStyle(fontFamily: "FinalL",color: myFavColor12,fontSize: 16),
    headline5: TextStyle(fontFamily: "FinalR",color: myFavColor12),
    headline6: TextStyle(fontFamily: "FinalB",color: myFavColor12),
    caption: TextStyle(fontFamily: "FinalB",color: myFavColor11),
    button: TextStyle(fontFamily: "FinalB",color: myFavColor12),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: myFavColor14,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor11),
    unselectedIconTheme: IconThemeData(color: myFavColor10),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(color: myFavColor11, fontFamily: "FinalB",fontSize: 12),
    unselectedItemColor: myFavColor10,
    unselectedLabelStyle: const TextStyle(fontFamily: "FinalR",fontSize: 12),
  ),
);