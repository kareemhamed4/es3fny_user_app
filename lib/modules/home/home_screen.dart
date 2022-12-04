import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/cubit/states.dart';
import 'package:es3fny_user_app/main_button/main_button.dart';
import 'package:es3fny_user_app/modules/edit_location/edit_location_screen.dart';
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
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "welcome".tr(context),
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        LayoutCubit.get(context).changeIndex(3);
                                      },
                                      child: Text(
                                        "welcome_caption".tr(context),
                                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                                      ),
                                    ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "address".tr(context),
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        NavigateTo(context: context, widget: const EditLocationScreen());
                                      },
                                      child: Text(
                                        "address_caption".tr(context),
                                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Text(
                          "need_ems".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 27),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'need_ems_caption'.tr(context),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        const LoadingButton(),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Text(
                          'fast_help'.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: size.height * 0.006,
                        ),
                        Text(
                          'fast_help_caption'.tr(context),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
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
                                    color: Theme.of(context).cardColor,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "card_home_1".tr(context),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(fontSize: 16, color: myFavColor),
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
                                    color: Theme.of(context).cardColor,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "card_home_2".tr(context),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(fontSize: 16, color: myFavColor),
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
              )),
        );
      },
    );
  }
}
