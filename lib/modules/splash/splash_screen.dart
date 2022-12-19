import 'dart:async';
import 'dart:math' as math;
import 'package:es3fny_user_app/layout/layout_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
    Timer(const Duration(seconds: 2), () {
      NavigateToReb(context: context, widget: const LayoutScreen());
    });
  }
  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Transform(
            alignment: Alignment.center,
            transform: langCode == "ar" ? Matrix4.rotationY(math.pi) :Matrix4.rotationY(math.pi * 2),
            child: Lottie.asset(
              "assets/lottie/ambulance.json",
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
