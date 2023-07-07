import 'dart:async';
import 'dart:math' as math;
import 'package:es3fny_user_app/biometric/biometric_helper.dart';
import 'package:es3fny_user_app/layout/layout_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  final bool isBlind;
  const SplashScreen({Key? key, required this.isBlind}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  bool showBiometric = false;
  bool isAuthenticated = false;

  @override
  void initState() {
    isBiometricsAvailable();
    isAuthenticatedDone();
    listenForAuthentication();
    super.initState();
  }

  Future<void> listenForAuthentication() async {
    bool isAuthenticated = false;
    while (!isAuthenticated) {
      try {
        if (this.isAuthenticated) {
          controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
          Timer(const Duration(seconds: 2), () {
            NavigateToReb(context: context, widget: LayoutScreen(isBlind: widget.isBlind));
          });
          isAuthenticated = true;
          setState(() {});
        } else {
          setState(() {});
        }
      } catch (e) {
        setState(() {});
      }
      await Future.delayed(const Duration(microseconds: 650));
    }
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  isAuthenticatedDone() async {
    isAuthenticated = await BiometricHelper().authenticate();
    setState(() {});
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Center(
              child: Transform(
                alignment: Alignment.center,
                transform: langCode == "ar" ? Matrix4.rotationY(math.pi) : Matrix4.rotationY(math.pi * 2),
                child: Lottie.asset(
                  "assets/lottie/ambulance.json",
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(
                onPressed: () {
                  isAuthenticatedDone();
                },
                icon: Icon(
                  Icons.fingerprint_outlined,
                  size: 50,
                  color: myFavColor5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
