import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/create_new_password/newpassword.dart';
import 'package:es3fny_user_app/modules/register/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/register/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreenForNewPassword extends StatefulWidget {
  final String phoneNumber;
  const OTPScreenForNewPassword({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<OTPScreenForNewPassword> createState() =>
      _OTPScreenForNewPasswordState();
}

class _OTPScreenForNewPasswordState extends State<OTPScreenForNewPassword> {
  late String otpCode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
      listener: (context, state) {
        if (state is PhoneAuthLoadingState) {
          showProgressIndicator(context);
        }
        if (state is PhoneOTPVerified) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NewPassword()));
        }
        if (state is PhoneAuthErrorState) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          displayErrorMotionToast(
            context: context,
            title: "error",
            description: errorMsg,
          );
        }
      },
      builder: (context, state) {
        PhoneAuthCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("otp".tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 30, color: myFavColor)),
                    SizedBox(
                      height: size.height * 0.184,
                    ),
                    Text(
                      "enter_otp".tr(context),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 22),
                    ),
                    SizedBox(
                      height: size.height * 0.063,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        appContext: context,
                        autoFocus: true,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.scale,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          borderWidth: 1,
                          activeColor: myFavColor,
                          inactiveColor: myFavColor,
                          inactiveFillColor: Colors.white,
                          activeFillColor: myFavColor.withOpacity(0.2),
                          selectedColor: myFavColor,
                          selectedFillColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        enableActiveFill: true,
                        onCompleted: (value) {
                          otpCode = value;
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.087,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("have_sent".tr(context)),
                        myTextButton(
                            context: context,
                            label: "have_sent_button".tr(context),
                            onPressed: () {}),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.029,
                    ),
                    myMaterialButton(
                      context: context,
                      onPressed: () {
                        cubit.submitOTP(otpCode);
                      },
                      labelWidget: Text(
                        "otp_button".tr(context),
                        style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(myFavColor),
        ),
      ),
    );
    showDialog(
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        builder: (context) {
          return alertDialog;
        });
  }
}
