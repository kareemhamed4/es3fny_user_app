import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      MainCubit.get(context).isDark ? myFavColor8 : myFavColor10,
      appBar: AppBar(
        title: Text(
          "الإعدادات",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 20),
        ),
        backgroundColor: MainCubit.get(context).isDark ? myFavColor8 : myFavColor10,
      ),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {

                  },
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                      "assets/images/3b8ny.jpeg"),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "محمد أحمد عبد الغني دومه",
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
                                      "وحدة شبراقاص",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.edit_outlined,
                              color: myFavColor9,
                            ),
                          ],
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
                            "الوضع الليلي",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            "تبديل الوضع",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_outlined,
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
                            "اللغة",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            "تغيير لغة التطبيق",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_outlined,
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
                            "تسجيل خروج من حسابك",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: MainCubit.get(context).isDark
                                ? myFavColor6
                                : myFavColor1,
                            size: 16,
                          ),
                          onTap: () {
                            MainCubit.get(context).signOut();
                            NavigateToReb(
                                context: context, widget: LoginScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "المزيد",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: myFavColor2.withOpacity(0.8)),
                ),
                const SizedBox(
                  height: 40,
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
                            "الدعم والمساعدة",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: MainCubit.get(context).isDark
                                ? myFavColor6
                                : myFavColor1,
                            size: 16,
                          ),
                          onTap: () {},
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
                            "عن التطبيق",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_outlined,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}