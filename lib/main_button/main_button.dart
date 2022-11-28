import 'dart:async';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key});

  @override
  LoadingButtonState createState() => LoadingButtonState();
}

class LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  int totalSeconds = 3;
  int secondsRemaining = 3;
  double progressFraction = 0.0;
  int percentage = 0;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        secondsRemaining -= 1;
        progressFraction = (totalSeconds - secondsRemaining) / totalSeconds;
        percentage = (progressFraction * 100).floor();
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
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              icon: Icon(
                Icons.info_outline,
                color: myFavColor,
              ),
              backgroundColor: myFavColor5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              title: Text(
                'تأكيد',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: myFavColor4),
              ),
              content: Text(
                'هل تريد بالفعل طلب الاسعاف ؟',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: myFavColor2, fontSize: 18),
              ),
              actions: <Widget>[
                MaterialButton(
                  color: Colors.white,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                  child: Text(
                    "الغاء",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: myFavColor, fontSize: 20),
                  ),
                ),
                MaterialButton(
                  color: myFavColor,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () {
                    Navigator.pop(context,'Ok');
                  },
                  child: Text(
                    "تأكيد",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),);
        setState(() {
          controller.reset();
          secondsRemaining = 3;
        });
      }
    });

    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (_) => controller.forward(),
      onTapUp: (_) {
        if (controller.status == AnimationStatus.forward) {
          controller.reverse();
        }
      },
      child: Container(
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
                    color: myFavColor4,
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
                style:
                    Theme.of(context).textTheme.button!.copyWith(fontSize: 40),
              )
            else if (controller.status == AnimationStatus.reverse)
              SvgPicture.asset("assets/images/semilogo.svg")
            else if (controller.status == AnimationStatus.completed)
              SvgPicture.asset('assets/images/semilogo.svg')
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
