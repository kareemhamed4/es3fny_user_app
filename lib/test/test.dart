import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  double? _progress;
  int _remainingTime = 3;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationController.addListener(() {
      setState(() {
        _progress = _animationController.value;
        _remainingTime = (_animationController.duration! * (1 - _progress!)).inSeconds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text('Hold the button to start the progress'),
            const SizedBox(height: 16),
            InkWell(
              onLongPress: _startProgress,
              onTapUp: (va){
                _stopProgress();
              },
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      value: _progress,
                    ),
                    Center(
                      child: Text(_remainingTime.toString()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startProgress() {
    _animationController.forward();
  }

  void _stopProgress() {
    _animationController.stop();
  }
}
