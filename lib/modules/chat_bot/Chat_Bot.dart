// ignore_for_file: file_names

import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: myFavColor));
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        )),
        backgroundColor: myFavColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'AidBot',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20, color: myFavColor9),
              ),
              const SizedBox(
                width: 8,
              ),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  CircleAvatar(
                    backgroundColor: myFavColor10,
                    radius: 25,
                    child: Image.asset(
                      'assets/images/Bot.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 5,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.238,
              ),
              Container(
                width: size.width * 0.754,
                height: size.height * 0.307,
                decoration: BoxDecoration(
                    color: myFavColor10,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.0135,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AidBot',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 24),
                            ),
                            Text(
                              'للمحادثة السريعة',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.0160,
                        ),
                        Image.asset(
                          'assets/images/chat bot.png',
                          width: size.width * 0.32,
                          height: size.height * 0.147,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'كيف يمكنني مساعدتك',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 24),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.266,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: myFavColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          size: 27,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'اكتب رسالتك.........',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: myFavColor10,
                        filled: true,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 22),
                      ),
                      onFieldSubmitted: (value) {
                        debugPrint(value);
                      },
                      onTap: () {},
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
