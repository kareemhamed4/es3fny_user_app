import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LanguageSelectEnum {arabic,english}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LanguageSelectEnum? _languageSelectEnum;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            const Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<LanguageSelectEnum>(
                      value: LanguageSelectEnum.arabic,
                      groupValue: _languageSelectEnum,
                      onChanged: (value){
                        setState((){
                          _languageSelectEnum = value;
                        });
                        context.read<MainCubit>().changeLang(context, "ar");
                      }
                  ),
                  Text("arabic".tr(context),style: Theme.of(context).textTheme.bodyText2,),
                  Radio<LanguageSelectEnum>(
                      value: LanguageSelectEnum.english,
                      groupValue: _languageSelectEnum,
                      onChanged: (value){
                        setState(() {
                          _languageSelectEnum = value;
                        });
                        context.read<MainCubit>().changeLang(context, "en");
                      }
                  ),
                  Text("english".tr(context),style: Theme.of(context).textTheme.bodyText2,),
                ],
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
        );
      },
    );
  }
}
