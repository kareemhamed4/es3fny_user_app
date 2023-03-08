import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          showMyBottomSheet(context: context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.language_outlined,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "app_language".tr(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          MainCubit.get(context).changeAppMode();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.brightness_4_outlined,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "change_app_mode".tr(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          CacheHelper.clearData().then((value) {
                            /*Timer(const Duration(seconds: 3), () {
                              RestartWidget.restartApp(context);
                            });*/
                            Navigator.of(context).popUntil((route) => route.isFirst);
                            NavigateToReb(
                                context: context, widget: const OnBoardingScreen());
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "clear_data".tr(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          MainCubit.get(context).signOut();
                          NavigateToReb(context: context, widget: LoginScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.logout_outlined,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "logout".tr(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void showMyBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        barrierColor: Colors.black38,
        backgroundColor: Theme.of(context).cardColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              right: 13,
              left: 13,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 80,
                      height: 5,
                      decoration: BoxDecoration(
                        color: myFavColor2.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close)),
                      const SizedBox(width: 20,),
                      Text(
                        "app_language".tr(context),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  myDivider(),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: radioValue,
                          groupValue: 1,
                          onChanged: (value){
                            MainCubit.get(context).changeRadioValue(1);
                            context.read<MainCubit>().changeLang(context, "ar");
                            displaySuccessMotionToast(
                                context: context,
                                title: "تم تغيير اللغة",
                                description: "اللغة المستخدمة حالياً اللغة العربية"
                            );
                          }
                      ),
                      Text("arabic".tr(context),style: Theme.of(context).textTheme.bodyText2,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: radioValue,
                          groupValue: 2,
                          onChanged: (value){
                            MainCubit.get(context).changeRadioValue(2);
                            context.read<MainCubit>().changeLang(context, "en");
                            displaySuccessMotionToast(
                                context: context,
                                title: "Language is changed",
                                description: "The current language is English"
                            );
                          }
                      ),
                      Text("english".tr(context),style: Theme.of(context).textTheme.bodyText2,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          );
        });
  }
}
