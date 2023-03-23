import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  cardColor: Colors.grey.shade200,
  scaffoldBackgroundColor: Colors.white,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: myFavColorWithOpacity,
  ),
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
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: myFavColor1),
    ),
  ),
  buttonTheme: ButtonThemeData(
      shape: OutlineInputBorder(
          borderSide: BorderSide(
              color: myFavColor1
          )
      )
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
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark
    ),
    elevation: 0,
  ),
  unselectedWidgetColor: myFavColor3,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor3),
    bodyText2: TextStyle(fontFamily: "Almarai-Regular",color: myFavColor3,fontSize: 18),
    subtitle1: TextStyle(fontFamily: "Inter-Medium",color: myFavColor3),
    subtitle2: TextStyle(fontFamily: "Almarai-Regular",color: myFavColor3),
    headline5: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor3),
    headline6: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor3),
    caption: TextStyle(fontFamily: "Almarai-Regular",color: myFavColor2),
    button: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor9
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontFamily: "Almarai-Bold",fontSize: 12),
    unselectedLabelStyle: const TextStyle(fontFamily: "Almarai-Regular",fontSize: 12),
  ),
);

ThemeData darkTheme = ThemeData(
  cardColor: myFavColor7,
  scaffoldBackgroundColor: myFavColor8,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: myFavColor5
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: myFavColor7,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: myFavColor5),
      ),
  ),
  buttonTheme: ButtonThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide(
        color: myFavColor5
      )
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: myFavColor4
      )
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(
            color: myFavColor5
        )
    ),
  ),
  iconTheme: IconThemeData(
    color: myFavColor5,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: myFavColor6,
    ),
    color: myFavColor8,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: myFavColor8,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: myFavColor8,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light
    ),
    elevation: 0,
  ),
  unselectedWidgetColor: myFavColor5,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor6),
    bodyText2: TextStyle(fontFamily: "Inter-Regular",color: myFavColor6),
    subtitle1: TextStyle(fontFamily: "Inter-Medium",color: myFavColor6),
    subtitle2: TextStyle(fontFamily: "Almarai-Regular",color: myFavColor6),
    headline5: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor6),
    headline6: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor6),
    caption: TextStyle(fontFamily: "Almarai-Regular",color: myFavColor5),
    button: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor6),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: myFavColor8,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: myFavColor5),
    unselectedIconTheme: IconThemeData(color: myFavColor4),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(color: myFavColor5, fontFamily: "Almarai-Bold",fontSize: 12),
    unselectedItemColor: myFavColor4,
    unselectedLabelStyle: const TextStyle(fontFamily: "Almarai-Regular",fontSize: 12),
  ),
);