import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
  String langCode = "en-US";
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
                  const SizedBox(width: 40,),
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
    );
  }
  void initSetting()async {
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
}
