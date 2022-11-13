import 'package:es3fny_user_app/main_button/main_button.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FluentIcons.person_circle_24_regular,
                            color: myFavColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                    text: "مرحباً، أسامة\n",
                                    style: Theme.of(context).textTheme.bodyText1,
                                    children: [
                                      TextSpan(
                                          text: "فتح ملفك الشخصي",
                                          style:
                                              Theme.of(context).textTheme.caption,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {}),
                                    ]),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            FluentIcons.location_24_regular,
                            color: myFavColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                    text: "طه الحكيم، طنطا\n",
                                    style: Theme.of(context).textTheme.bodyText1,
                                    children: [
                                      TextSpan(
                                          text: "تعديل موقعك الحالي",
                                          style:
                                              Theme.of(context).textTheme.caption,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {}),
                                    ]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Text(
                    'هل تحتاج مساعدة طوارئ ؟',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 26, color: Colors.black,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'فقط قم بالضغط بإستمرار لمده ثلاث ثوانٍ',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 14,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  const LoadingButton(),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Text(
                    'تحتاج إلي المساعدة السريعة ؟',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: size.height * 0.105,
                            width: size.width * 0.36,
                            child: Card(
                              color: Colors.grey.shade200,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "تعرضت لحادث ؟",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 18, color: myFavColor),
                                  ),
                                  Icon(
                                    (Icons.arrow_forward),
                                    color: myFavColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.077),
                        Expanded(
                          child: SizedBox(
                            height: size.height * 0.105,
                            width: size.width * 0.36,
                            child: Card(
                              color: Colors.grey.shade200,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "الإسعافات الأولية",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 18, color: myFavColor),
                                  ),
                                  Icon(
                                    (Icons.arrow_forward),
                                    color: myFavColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
