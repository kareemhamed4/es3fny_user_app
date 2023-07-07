import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/modules/tts_stt/tts.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ProfileCubit.get(context).userModel;
        return Scaffold(
          backgroundColor:
              MainCubit.get(context).isDark ? myFavColor8 : myFavColor10,
          appBar: AppBar(
            title: Text(
              "setting".tr(context),
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
            ),
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            backgroundColor:
                MainCubit.get(context).isDark ? myFavColor8 : myFavColor10,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        elevation: 6,
                        color: myFavColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          side: BorderSide.none,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 21),
                          child: ConditionalBuilder(
                            condition: model != null,
                            builder: (context) => Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(model !=
                                              null
                                          ? model.data!.profileImage!
                                          : "https://img.freepik.com/free-icon/user_318-159712.jpg"),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    if(model != null)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          model.data != null
                                              ? model.data!.name!
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          model.data != null
                                              ? model.data!.nationalId!
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            fallback: (context) => Center(
                                child: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: myFavColor10,
                                      strokeWidth: 2,
                                    ))),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 225,
                    child: Card(
                      color: MainCubit.get(context).isDark
                          ? myFavColor7
                          : myFavColor9,
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        side: BorderSide.none,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: MainCubit.get(context).isDark
                                  ? myFavColor8.withOpacity(0.5)
                                  : myFavColor2.withOpacity(0.05),
                              child: Icon(
                                Icons.nights_stay_outlined,
                                color: myFavColor.withOpacity(0.5),
                              ),
                            ),
                            title: Text(
                              "night_mode".tr(context),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "night_mode_caption".tr(context),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: MainCubit.get(context).isDark
                                  ? myFavColor6
                                  : myFavColor1,
                              size: 16,
                            ),
                            onTap: () {
                              MainCubit.get(context).changeAppMode();
                            },
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: MainCubit.get(context).isDark
                                  ? myFavColor8.withOpacity(0.5)
                                  : myFavColor2.withOpacity(0.05),
                              child: Icon(
                                Icons.language_outlined,
                                color: myFavColor.withOpacity(0.5),
                                size: 20,
                              ),
                            ),
                            title: Text(
                              "language".tr(context),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "language_caption".tr(context),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: MainCubit.get(context).isDark
                                  ? myFavColor6
                                  : myFavColor1,
                              size: 16,
                            ),
                            onTap: () {
                              showMyBottomSheet(
                                context: context,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "app_language".tr(context),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<MainCubit>()
                                                .changeLang(context, "ar");
                                            MainCubit.get(context)
                                                .changeLanguageValue(0);
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: langContainerIndex == 0
                                                    ? myFavColor
                                                    : myFavColor1
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                                border: langContainerIndex ==
                                                        0
                                                    ? Border.all(
                                                        color: myFavColor1)
                                                    : Border.all(
                                                        color: myFavColor1
                                                            .withOpacity(0.1),
                                                      )),
                                            child: Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              child: Padding(
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: 16),
                                                child: Text(
                                                  "arabic".tr(context),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          color: langContainerIndex ==
                                                                  0
                                                              ? myFavColor9
                                                              : myFavColor3),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<MainCubit>()
                                                .changeLang(context, "en");
                                            MainCubit.get(context)
                                                .changeLanguageValue(1);
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: langContainerIndex == 1
                                                    ? myFavColor
                                                    : myFavColor1
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(4),
                                                ),
                                                border: langContainerIndex ==
                                                        1
                                                    ? Border.all(
                                                        color: myFavColor1)
                                                    : Border.all(
                                                        color: myFavColor1
                                                            .withOpacity(0.1),
                                                      )),
                                            child: Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              child: Padding(
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: 16),
                                                child: Text(
                                                  "english".tr(context),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          color: langContainerIndex ==
                                                                  1
                                                              ? myFavColor9
                                                              : myFavColor3),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: MainCubit.get(context).isDark
                                  ? myFavColor8.withOpacity(0.5)
                                  : myFavColor2.withOpacity(0.05),
                              child: Icon(
                                Icons.logout_outlined,
                                color: myFavColor.withOpacity(0.5),
                                size: 20,
                              ),
                            ),
                            title: Text(
                              "logout".tr(context),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "logout_caption".tr(context),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: MainCubit.get(context).isDark
                                  ? myFavColor6
                                  : myFavColor1,
                              size: 16,
                            ),
                            onTap: () {
                              MainCubit.get(context).signOut();
                              ProfileCubit.get(context).stopLocationUpdates();
                              NavigateToReb(
                                  context: context, widget: LoginScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "more".tr(context),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: myFavColor2.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 145,
                    child: Card(
                      color: MainCubit.get(context).isDark
                          ? myFavColor7
                          : myFavColor9,
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        side: BorderSide.none,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: MainCubit.get(context).isDark
                                  ? myFavColor8.withOpacity(0.5)
                                  : myFavColor2.withOpacity(0.05),
                              child: Icon(
                                Icons.support_agent_outlined,
                                color: myFavColor.withOpacity(0.5),
                                size: 20,
                              ),
                            ),
                            title: Text(
                              "support".tr(context),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: MainCubit.get(context).isDark
                                  ? myFavColor6
                                  : myFavColor1,
                              size: 16,
                            ),
                            onTap: () {
                              NavigateTo(
                                  context: context,
                                  widget: const TextToSpeech());
                            },
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: MainCubit.get(context).isDark
                                  ? myFavColor8.withOpacity(0.5)
                                  : myFavColor2.withOpacity(0.05),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: myFavColor.withOpacity(0.5),
                                size: 20,
                              ),
                            ),
                            title: Text(
                              "about_app".tr(context),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: MainCubit.get(context).isDark
                                  ? myFavColor6
                                  : myFavColor1,
                              size: 16,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 20,),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Designed, developed and revised by Rapid Response Company',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4,),
                        Text(
                          'All Copyrights © Reserved for RapidResponse.com 2022',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
