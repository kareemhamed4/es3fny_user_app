import 'package:avatar_glow/avatar_glow.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/cubit/states.dart';
import 'package:es3fny_user_app/main_button/main_button.dart';
import 'package:es3fny_user_app/modules/chat_bot/Chat_Bot.dart';
import 'package:es3fny_user_app/modules/chat_bot/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/edit_location/edit_location_screen.dart';
import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of(context);
        return BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.person_circle_24_regular,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ConditionalBuilder(
                                            condition:
                                                (cubit.userModel != null && cubit.userModel!.data != null),
                                            builder: (context) => Text(
                                              "${"welcome".tr(context)}${cubit.splitSentence(cubit.userModel!.data!.name!)}..",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 16),
                                            ),
                                            fallback: (context) => Text(
                                              "welcome".tr(context),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              LayoutCubit.get(context)
                                                  .changeIndex(3);
                                            },
                                            child: Text(
                                              "welcome_caption".tr(context),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.location_24_regular,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "address".tr(context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(fontSize: 16),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              NavigateTo(
                                                  context: context,
                                                  widget:
                                                      const EditLocationScreen());
                                            },
                                            child: Text(
                                              "address_caption".tr(context),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "need_ems".tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 27),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'need_ems_caption'.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              const Center(child: LoadingButton()),
                              const Spacer(),
                              Text(
                                'fast_help'.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: size.height * 0.006,
                              ),
                              Text(
                                'fast_help_caption'.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          ChatBotCubit.get(context)
                                              .sendMessage("تعرضت لحادث")
                                              .then((value) {
                                            NavigateTo(
                                                context: context,
                                                widget: ChatBotScreen());
                                          });
                                        },
                                        child: SizedBox(
                                          height: size.height * 0.105,
                                          width: size.width * 0.36,
                                          child: Card(
                                            color: Theme.of(context).cardColor,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "card_home_1".tr(context),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(fontSize: 16),
                                                ),
                                                const Icon(
                                                  (Icons.arrow_forward),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.077),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          ChatBotCubit.get(context)
                                              .sendMessage("الإسعافات الأولية")
                                              .then((value) {
                                            NavigateTo(
                                                context: context,
                                                widget: ChatBotScreen());
                                          });
                                        },
                                        child: SizedBox(
                                          height: size.height * 0.105,
                                          width: size.width * 0.36,
                                          child: Card(
                                            color: Theme.of(context).cardColor,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "card_home_2".tr(context),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(fontSize: 16),
                                                ),
                                                const Icon(
                                                  (Icons.arrow_forward),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 105),
                            child: AvatarGlow(
                              endRadius: 42,
                              animate: true,
                              duration: const Duration(milliseconds: 2000),
                              glowColor: myFavColor,
                              repeatPauseDuration:
                                  const Duration(milliseconds: 100),
                              showTwoGlows: false,
                              child: GestureDetector(
                                onTap: () {
                                  NavigateTo(
                                      context: context,
                                      widget: ChatBotScreen());
                                },
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    "assets/images/chatbot-kareem.png",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
