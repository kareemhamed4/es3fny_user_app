import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(FluentIcons.person_circle_24_regular,color: myFavColor,size: 30,),
                          const SizedBox(width: 5,),
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
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                    ]
                                  ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(FluentIcons.location_24_regular,color: myFavColor,size: 30,),
                          const SizedBox(width: 5,),
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
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
