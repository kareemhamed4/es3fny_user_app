import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  FlutterTts tts = FlutterTts();
  TextEditingController controller = TextEditingController();
  double volume = 1;
  double pitch = 1;
  double rate = 0.5;
  List<String>? languages;
  String langCode = "ar_EG";

  var isListening = false;
  SpeechToText stt = SpeechToText();
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  bool logEvents = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                minLines: 5,
                maxLines: 20,
              ),
              Row(
                children: [
                  Text(
                    "مستوي الصوت",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Expanded(
                    child: Slider(
                      max: 1,
                      min: 0,
                      divisions: 10,
                      value: volume,
                      onChanged: (value) {
                        setState(() {
                          volume = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    volume.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "درجة الصوت",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Expanded(
                    child: Slider(
                      max: 2,
                      min: 0.5,
                      divisions: 15,
                      value: pitch,
                      onChanged: (value) {
                        setState(() {
                          pitch = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    pitch.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "السرعة",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Expanded(
                    child: Slider(
                      max: 1,
                      min: 0,
                      divisions: 10,
                      value: rate,
                      onChanged: (value) {
                        setState(() {
                          rate = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    rate.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _speak,
                      child: Text(
                        "تشغيل",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _stop,
                      child: Text(
                        "ايقاف",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: rose,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await stt.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  stt.listen(
                    onResult: resultListener,
                    listenFor: const Duration(seconds: 60),
                    pauseFor: const Duration(seconds: 9),
                    partialResults: true,
                    onSoundLevelChange: soundLevelListener,
                    cancelOnError: true,
                    listenMode: ListenMode.confirmation,
                    localeId: "ar_EG"
                  );
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              isListening = false;
            });
            await stt.stop();
            setState(() {
              level = 0;
            });
          },
          child: CircleAvatar(
            radius: 35,
            backgroundColor: rose,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: myFavColor9,
            ),
          ),
        ),
      ),
    );
  }

  void initSetting() async {
    await tts.setVolume(volume);
    await tts.setPitch(pitch);
    await tts.setSpeechRate(rate);
    await tts.setLanguage(langCode);
  }

  void _speak() async {
    initSetting();
    await tts.speak(controller.text);
  }

  void _stop() async {
    await tts.stop();
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
    setState(() {
      this.level = level;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    setState(() {
      controller.text = result.recognizedWords;
    });
  }

  void _logEvent(String eventDescription) {
    if (logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      debugPrint('$eventTime $eventDescription');
    }
  }
}
