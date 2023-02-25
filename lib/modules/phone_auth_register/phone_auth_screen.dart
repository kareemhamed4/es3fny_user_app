import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/otp/otp_screen.dart';
import 'package:es3fny_user_app/modules/phone_auth_register/cubit/phone_cubit.dart';
import 'package:es3fny_user_app/modules/phone_auth_register/cubit/phone_states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneAuthScreen extends StatefulWidget {
  final String name;
  final String email;
  final String nationalId;
  final String gender;
  final int age;
  final String password;

  const PhoneAuthScreen(
      {Key? key,
      required this.email,
      required this.name,
      required this.nationalId,
      required this.gender,
      required this.age,
      required this.password})
      : super(key: key);
  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  late String phoneNumber;
  late String name = widget.name;
  late String email = widget.email;
  late String nationalId = widget.nationalId;
  late String gender = widget.gender;
  late int age = widget.age;
  late String password = widget.password;
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context.read<PhoneAuthCubit>().isEnabledButton = false;
    super.initState();
  }

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
              widget: const OTPScreen());
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
      builder: (context, states) {
        PhoneAuthCubit cubit = BlocProvider.of(context);
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16.0, end: 16.0, bottom: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Emerg-e-care",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 36),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
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
                          return "register_phone_valid".tr(context);
                        }
                        return null;
                      },
                      autoFocus: true,
                      onInputChanged: (PhoneNumber value) {
                        if (value.phoneNumber!.length == 13) {
                          cubit.changeButtonState(1);
                        } else {
                          cubit.changeButtonState(0);
                        }
                      },
                      inputDecoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "1X-XXXX-XXXX",
                      ),
                      selectorConfig: const SelectorConfig(
                        setSelectorButtonAsPrefixIcon: true,
                        leadingPadding: 16,
                      ),
                      onSaved: (phoneNumber) {
                        this.phoneNumber = phoneNumber.phoneNumber!;
                      },
                    ),
                  ),
                  const Spacer(),
                  myMaterialButton(
                    context: context,
                    isEnabled: cubit.isEnabledButton,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        cubit.submitPhoneNumber(phoneNumber);
                      }
                    },
                    labelWidget: Text(
                      'إنشاء',
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
