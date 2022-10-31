import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:es3fny_user_app/otp/otp_screen.dart';
import 'package:es3fny_user_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
//siko
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ES3FNY USER APP',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const OnBoardingScreen(),
    );
  }
}