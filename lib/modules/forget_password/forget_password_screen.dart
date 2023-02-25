import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/create_new_password/otp_new_password.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/phone_auth_register/cubit/phone_cubit.dart';
import 'package:es3fny_user_app/modules/phone_auth_register/cubit/phone_states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

//ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  late String phoneNumber;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
      listener: (context, state) {
        if (state is PhoneAuthLoadingState) {
          showProgressIndicator(context);
        }
        if (state is PhoneNumberSubmitted) {
          NavigateTo(
              context: context,
              widget: OTPScreenForNewPassword(
                phoneNumber: phoneNumber,
              ));
        }
        if (state is PhoneAuthErrorState) {
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
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "forget_password".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: myFavColor, fontSize: 32),
                        ),
                        SizedBox(
                          height: size.height * 0.084,
                        ),
                        Text(
                          "enter_phone".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: size.height * 0.002,
                        ),
                        Text(
                          "enter_phone_caption_1".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          "enter_phone_caption_2".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: size.height * 0.0703,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "forget_phone".tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.00922,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: InternationalPhoneNumberInput(
                            countries: const ["EG"],
                            spaceBetweenSelectorAndTextField: 20,
                            selectorTextStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 18),
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 18),
                            maxLength: 12,
                            validator: (value) {
                              if (value!.length < 12) {
                                return "forget_phone_valid".tr(context);
                              }
                              return null;
                            },
                            hintText: "1X-XXXX-XXXX",
                            onInputChanged: (PhoneNumber value) {},
                            inputDecoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                            ),
                            selectorConfig: const SelectorConfig(
                              setSelectorButtonAsPrefixIcon: true,
                              leadingPadding: 16,
                            ),
                            onSaved: (phoneNumber){
                              this.phoneNumber = phoneNumber.phoneNumber!;
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.023,
                        ),
                        InkWell(
                          onTap: () {
                            NavigateTo(
                                context: context, widget: LoginScreen());
                          },
                          child: Text(
                            "forget_phone_caption".tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.101,
                        ),
                        myMaterialButton(
                            context: context,
                            onPressed: () {
                              showProgressIndicator(context);
                              Navigator.pop(context);
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'otp_snackBar'.tr(context))));
                                cubit.submitPhoneNumber(phoneNumber);
                              }
                            },
                          labelWidget: Text(
                            "send_button".tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                            ),
                      ],
                    ),
                  ),
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

  String generateCountryFlag() {
    String countryCode = "eg";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
