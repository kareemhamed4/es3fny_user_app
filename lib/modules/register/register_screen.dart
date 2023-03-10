import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/dialogs/policy_dialog.dart';
import 'package:es3fny_user_app/modules/otp/otp_screen.dart';
import 'package:es3fny_user_app/modules/register/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/register/cubit/states.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String phoneNumber;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> genderItems = [
    'male',
    'female',
  ];
  String selectedValue = "";
  final List<String> searchItems = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  String? selectedSearchValue;
  final TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
      listener: (context, state) {
        if (state is PhoneAuthLoadingState) {
          showProgressIndicator(context);
        }
        if (state is PhoneNumberSubmitted) {

        }
        if (state is PhoneAuthErrorState) {
          String errorMsg = (state).errorMsg;
          displayErrorMotionToast(
            context: context,
            title: "error",
            description: errorMsg,
          );
        }
        if (state is SignUpSuccessState) {
            if (state.signup.status!) {
              CacheHelper.saveData(key: "token", value: state.signup.data!.token)
                  .then((value) {
                token = state.signup.data!.token;
                NavigateTo(context: context, widget: const OTPScreen());
              });
              context.read<PhoneAuthCubit>().submitPhoneNumber(phoneNumber);
            }
            if(!state.signup.status!){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${state.signup.message}",
                  ),
                ),
              );
            }
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
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16.0, end: 16.0, bottom: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'register_label'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 30, color: myFavColor),
                      ),
                      SizedBox(
                        height: size.height * 0.0346,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_name'.tr(context),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                        validate: (value) {
                          if (value!.length < 8) {
                            return "register_name_valid".tr(context);
                          }
                          return null;
                        },
                        context: context,
                        type: TextInputType.text,
                        onSubmit: (value) {},
                        controller: nameController,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'الرقم القومي',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      phoneTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "برجاء ادخال الرقم القومي";
                          }
                          return null;
                        },
                        context: context,
                        maxLength2: 14,
                        type: TextInputType.number,
                        onSubmit: (value) {},
                        controller: nationalIdController,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'رقم الهاتف',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: InternationalPhoneNumberInput(
                          countries: const ["EG"],
                          spaceBetweenSelectorAndTextField: 20,
                          selectorTextStyle: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18),
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18),
                          maxLength: 12,
                          validator: (value) {
                            if (value!.length < 12) {
                              return "register_phone_valid".tr(context);
                            }
                            return null;
                          },
                          onInputChanged: (PhoneNumber value) {
                            /*if (value.phoneNumber!.length == 13) {
                              cubit.changeButtonState(1);
                            } else {
                              cubit.changeButtonState(0);
                            }*/
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
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_gender'.tr(context),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      DropdownButtonFormField2(
                        decoration: const InputDecoration(
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        isExpanded: true,
                        hint: Text(
                          "register_gender_choose".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: myFavColor5,
                                  fontSize: 16,
                                  fontFamily: "FinalR"),
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        iconSize: 30,
                        buttonHeight: 48,
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).cardColor),
                        items: genderItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item.tr(context),
                                  onTap: () {
                                    setState(() => (){
                                      selectedValue = item.tr(context);
                                    },);
                                  },
                                  child: Text(
                                    item.tr(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 18, fontFamily: "FinalR"),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return "register_gender_choose".tr(context);
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_age'.tr(context),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      phoneTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "register_age_valid".tr(context);
                          }
                          return null;
                        },
                        context: context,
                        maxLength2: 2,
                        type: TextInputType.number,
                        onSubmit: (value) {},
                        controller: ageController,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_email'.tr(context),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                        validate: (value) {
                          if (!value!.contains("@")) {
                            return "register_email_valid".tr(context);
                          }
                          return null;
                        },
                        context: context,
                        onSubmit: (value) {},
                        textAlign: TextAlign.left,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_password'.tr(context),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                        validate: (value) {
                          if (value!.length < 8) {
                            return "register_password_valid".tr(context);
                          }
                          return null;
                        },
                        hint: '● ● ● ● ● ● ● ●',
                        context: context,
                        onSubmit: (value) {},
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPasswordRegister,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeSuffixIconRegister();
                          },
                          icon: Icon(
                            cubit.suffixIconRegister,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_confirm_password'.tr(context),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                          validate: (value) {
                            if (value != passwordController.text) {
                              return "register_confirm_password_valid"
                                  .tr(context);
                            }
                            return null;
                          },
                          hint: '● ● ● ● ● ● ● ●',
                          context: context,
                          onSubmit: (value) {},
                          controller: passwordConfirmController,
                          type: TextInputType.visiblePassword,
                          isPassword: cubit.isPasswordConfirmRegister,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeSuffixIconConfirmRegister();
                            },
                            icon: Icon(
                              cubit.suffixIconConfirmRegister,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      ConditionalBuilder(
                        condition: states is! SignUpLoadingState,
                        builder:(context) => myMaterialButton(
                          context: context,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              cubit.userModel(
                                  name: nameController.text,
                                  email: emailController.text,
                                  nationalId: nationalIdController.text,
                                  phone: phoneNumber.substring(phoneNumber.length - 10),
                                  gender: selectedValue,
                                  age: int.parse(ageController.text),
                                  password: passwordController.text,
                              );
                            }
                          },
                          labelWidget: Text(
                            'register_button'.tr(context),
                            style: Theme.of(context).textTheme.button!.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        fallback: (context) => myMaterialButton(
                          context: context,
                          onPressed: () {
                            null;
                          },
                          labelWidget: const Center(
                            child: SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "rules".tr(context),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "",
                          children: [
                            TextSpan(
                                text: "terms".tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: myFavColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return PolicyDialog(
                                          mdFileName: "terms_conditions.md",
                                        );
                                      },
                                    );
                                  }),
                            TextSpan(
                              text: "and".tr(context),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            TextSpan(
                                text: "privacy".tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: myFavColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return PolicyDialog(
                                          mdFileName: "privacy_policy.md",
                                        );
                                      },
                                    );
                                  }),
                          ],
                        ),
                      )
                    ],
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
