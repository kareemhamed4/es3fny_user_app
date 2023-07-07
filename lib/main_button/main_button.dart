import 'dart:async';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/main_button/cubit/cubit.dart';
import 'package:es3fny_user_app/main_button/cubit/states.dart';
import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/tracking_info/tracking_info_screen.dart';
import 'package:es3fny_user_app/responsive.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key});

  @override
  LoadingButtonState createState() => LoadingButtonState();
}

class LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  int secondsRemaining = 3;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        secondsRemaining -= 1;
      });
      if (controller.status == AnimationStatus.reverse) {
        setState(() {
          secondsRemaining = 3;
        });
      }
      if (controller.status == AnimationStatus.dismissed) {
        setState(() {
          secondsRemaining = 3;
        });
      }
      if (controller.status == AnimationStatus.completed) {
        showMyDialog(
            context: context,
            icon: Icons.info_outline,
            titleWidget: Text(
              "alert".tr(context),
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
            contentWidget: Text(
              "alert_content".tr(context),
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
            ),
            onConfirm: () {
              Navigator.pop(context, "Ok");
              if (context.read<MainCubit>().hasInternet) {
                context
                    .read<SendRequestCubit>()
                    .sendRequest()
                    .then((value) {
                      if(context.read<SendRequestCubit>().sendRequestModel!.status!){
                        SendRequestCubit.get(context).listenForParamedicInfo(
                          requestId: SendRequestCubit.get(context)
                              .sendRequestModel!
                              .data!
                              .requesId!,
                        );
                      }
                });
              } else {
                showNoInternetDialog(context: context);
              }
            });
        setState(() {
          controller.reset();
          secondsRemaining = 3;
        });
      }
    });
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SendRequestCubit, SendRequestStates>(
      listener: (context, state) {
        if (state is SendRequestLoadingState) {
          showProgressIndicator(context);
          Navigator.pop(context);
        }
        if (state is SendRequestSuccessState) {
          if(state.sendRequest.status!){
            context.read<LayoutCubit>().changeIndex(1);
            NavigateTo(context: context, widget: const TrackingInfoScreen());
            displaySuccessMotionToast(
              context: context,
              title: "Done!",
              description: state.sendRequest.msg
            );
          }
          if(!state.sendRequest.status!){
            displayWarningMotionToast(
                context: context,
                title: "Oops!",
                description: state.sendRequest.msg
            );
          }
        }
      },
      builder: (context, state) {
        SendRequestCubit cubit = BlocProvider.of(context);
        var model = cubit.paramedicModel;
        return GestureDetector(
          onTapDown: (_) {
            if (model != null && model.data != null) {
              null;
            } else if (model == null) {
              controller.forward();
            }
          },
          onTapUp: (_) {
            if (controller.status == AnimationStatus.forward) {
              controller.reverse();
            }
          },
          child: Responsive(
            mobile: buildMobileButtonScreen(size, context),
            desktop: buildDesktopButtonScreen(context),
            tablet: buildDesktopButtonScreen(context),
          ),
        );
      },
    );
  }

  Widget buildDesktopButtonScreen(BuildContext context) {
    return Container(
      height: 220,
      width: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: myFavColor.withOpacity(0.9),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            height: 220,
            width: 220,
            child: CircularProgressIndicator(
              strokeWidth: 17,
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).scaffoldBackgroundColor),
            ),
          ),
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: myFavColor3,
                  spreadRadius: 6,
                  blurRadius: 9,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: CircularProgressIndicator(
              strokeWidth: 15,
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
            ),
          ),
          SizedBox(
            height: 220,
            width: 220,
            child: CircularProgressIndicator(
              strokeWidth: 15,
              value: controller.value,
              valueColor: AlwaysStoppedAnimation<Color>(myFavColor),
            ),
          ),
          if (controller.status == AnimationStatus.dismissed)
            SvgPicture.asset("assets/images/semilogo.svg")
          else if (controller.status == AnimationStatus.forward)
            Text(
              secondsRemaining.toString(),
              style: Theme.of(context).textTheme.button!.copyWith(fontSize: 40),
            )
          else if (controller.status == AnimationStatus.reverse)
            SvgPicture.asset("assets/images/semilogo.svg")
          else if (controller.status == AnimationStatus.completed)
            SvgPicture.asset('assets/images/semilogo.svg')
        ],
      ),
    );
  }

  Widget buildMobileButtonScreen(Size size, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: myFavColor.withOpacity(0.9),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.3,
            width: size.width * 0.65,
            child: CircularProgressIndicator(
              strokeWidth: 17,
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).scaffoldBackgroundColor),
            ),
          ),
          Container(
            height: size.height * 0.3,
            width: size.width * 0.65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: myFavColor3,
                  spreadRadius: 6,
                  blurRadius: 9,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: CircularProgressIndicator(
              strokeWidth: 15,
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
            ),
          ),
          SizedBox(
            height: size.height * 0.3,
            width: size.width * 0.65,
            child: CircularProgressIndicator(
              strokeWidth: 15,
              value: controller.value,
              valueColor: AlwaysStoppedAnimation<Color>(myFavColor),
            ),
          ),
          if (controller.status == AnimationStatus.dismissed)
            SvgPicture.asset("assets/images/semilogo.svg")
          else if (controller.status == AnimationStatus.forward)
            Text(
              secondsRemaining.toString(),
              style: Theme.of(context).textTheme.button!.copyWith(fontSize: 40),
            )
          else if (controller.status == AnimationStatus.reverse)
            SvgPicture.asset("assets/images/semilogo.svg")
          else if (controller.status == AnimationStatus.completed)
            SvgPicture.asset('assets/images/semilogo.svg')
        ],
      ),
    );
  }
}
