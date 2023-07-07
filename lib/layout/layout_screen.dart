import 'dart:async';
import 'dart:math';

import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class LayoutScreen extends StatefulWidget {
  final bool isBlind;
  const LayoutScreen({Key? key, required this.isBlind}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late AudioPlayer _audioPlayer;
  /*final _playlist = ConcatenatingAudioSource(children: [
    AudioSource.asset("assets/voices/hello.mp3"),
    AudioSource.asset("assets/voices/need help.mp3"),
  ]);*/

  var isListening = false;
  SpeechToText stt = SpeechToText();
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  bool logEvents = false;
  TextEditingController soundController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initSound();
    _audioPlayer.play();
  }

  Future<void> _initSound() async {
    await _audioPlayer.setLoopMode(LoopMode.off);
    await _audioPlayer.setAsset("assets/voices/hello and ask.mp3").whenComplete(() {
      Timer(const Duration(seconds: 6), () {
        _listenForSpeech();
      });
    });
  }

  void _listenForSpeech() async {
    if (!isListening) {
      var available = await stt.initialize();
      if (available) {
        setState(() {
          isListening = true;
          stt
              .listen(
                  onResult: resultListener,
                  listenFor: const Duration(seconds: 6),
                  pauseFor: const Duration(seconds: 2),
                  partialResults: true,
                  onSoundLevelChange: soundLevelListener,
                  cancelOnError: true,
                  listenMode: ListenMode.confirmation,
                  localeId: "ar_EG")
              .whenComplete(() {
            Timer(const Duration(seconds: 6), () {
              debugPrint(soundController.text);
              LayoutCubit.get(context)
                  .makeVoicePrediction(
                    message: soundController.text,
                    voiceParam: "1",
                  );
            });
          });
        });
      }
    }
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
    setState(() {
      this.level = level;
    });
  }

  Future<void> resultListener(SpeechRecognitionResult result) async {
    _logEvent('Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    setState(() {
      soundController.text = result.recognizedWords;
    });
  }

  void _logEvent(String eventDescription) {
    if (logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      debugPrint('$eventTime $eventDescription');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) => {
        if (state is VoicePredictionSuccessState)
          {
            if (LayoutCubit.get(context).voicePredictionResult == 1)
              {
                _audioPlayer.setAsset("assets/voices/done request and wish.mp3"),
                _audioPlayer.play(),
              }else{
              _audioPlayer.setAsset("assets/voices/no need ems.mp3"),
              _audioPlayer.play(),
            }
          }
      },
      builder: (context, state) {
        LayoutCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<bool>(
                stream: context.read<MainCubit>().internetStream,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData && !snapshot.data!) {
                    return GestureDetector(
                      onTap: () {
                        showNoInternetDialog(context: context);
                      },
                      child: Container(
                        height: 16,
                        width: double.infinity,
                        color: myFavColor,
                        child: Center(
                          child: Text(
                            "noInternet".tr(context),
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12, color: myFavColor9),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Container(
                        decoration: (cubit.currentIndex == 0)
                            ? BoxDecoration(border: Border(top: BorderSide(color: myFavColor, width: 3)))
                            : const BoxDecoration(),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 14,
                            ),
                            Icon(FluentIcons.home_24_regular),
                          ],
                        ),
                      ),
                      label: "Home".tr(context)),
                  BottomNavigationBarItem(
                      icon: Container(
                          decoration: (cubit.currentIndex == 1)
                              ? BoxDecoration(border: Border(top: BorderSide(color: myFavColor, width: 3)))
                              : const BoxDecoration(),
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 14,
                              ),
                              Icon(FluentIcons.location_24_regular),
                            ],
                          )),
                      label: "Tracking".tr(context)),
                  BottomNavigationBarItem(
                      icon: Container(
                          decoration: (cubit.currentIndex == 2)
                              ? BoxDecoration(border: Border(top: BorderSide(color: myFavColor, width: 3)))
                              : const BoxDecoration(),
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 14,
                              ),
                              Icon(FluentIcons.glance_24_regular),
                            ],
                          )),
                      label: "Services".tr(context)),
                  BottomNavigationBarItem(
                      icon: Container(
                          decoration: (cubit.currentIndex == 3)
                              ? BoxDecoration(border: Border(top: BorderSide(color: myFavColor, width: 3)))
                              : const BoxDecoration(),
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 14,
                              ),
                              Icon(FluentIcons.person_24_regular),
                            ],
                          )),
                      label: "Profile".tr(context)),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
