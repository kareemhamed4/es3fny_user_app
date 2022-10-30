import 'package:es3fny_user_app/modules/test_components/test_components.dart';
import 'package:es3fny_user_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';

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
      home: const TestComponents(),
    );
  }
}