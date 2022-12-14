import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/dialogs/policy_dialog.dart';
import 'package:es3fny_user_app/modules/splash/splash_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;

  String typeValidate = "";
  List<String> list = <String>[
    'male',
    'female',
  ];
  String? dropdownValue;

  final List<String> genderItems = [
    'male',
    'female',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, states) {},
      builder: (context, states) {
        MainCubit cubit = BlocProvider.of(context);
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
          body: SafeArea(
            child: Center(
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
                            .bodyText2!
                            .copyWith(fontSize: 30, color: myFavColor),
                      ),
                      SizedBox(
                        height: size.height * 0.0346,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_name'.tr(context),
                          style: Theme.of(context).textTheme.bodyText2,
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
                          'register_phone'.tr(context),
                          style: Theme.of(context).textTheme.bodyText2,
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
                          hintText: "1X-XXXX-XXXX",
                          onInputChanged: (PhoneNumber value) {},
                          inputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: myFavColor.withOpacity(0.5),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: myFavColor.withOpacity(0.5),
                                )),
                          ),
                          selectorConfig: const SelectorConfig(
                            setSelectorButtonAsPrefixIcon: true,
                            leadingPadding: 16,
                          ),
                        ),
                      ),
                      /*phoneTextFormField(
                        validate: (value) {
                          if (value!.length < 10) {
                            return "رقم هاتف غير صحيح";
                          }
                          return null;
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 10, end: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                generateCountryFlag(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                "+20",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        context: context,
                        textAlign: TextAlign.left,
                        type: TextInputType.phone,
                        onSubmit: (value) {},
                        maxLength2: 10,
                        controller: phoneController,
                      ),*/
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_gender'.tr(context),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: myFavColor.withOpacity(0.5),
                        ),
                      ),
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        isExpanded: true,
                        hint: Text(
                          "register_age_choose".tr(context),
                          style: const TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 48,
                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: genderItems
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item.tr(context),
                              child: Text(
                                item.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: myFavColor4,fontSize: 18,fontFamily: "FinalR"),
                              ),
                            ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'register_gender_valid'.tr(context);
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
                          style: Theme.of(context).textTheme.bodyText2,
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
                          style: Theme.of(context).textTheme.bodyText2,
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
                          style: Theme.of(context).textTheme.bodyText2,
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
                          icon: Icon(cubit.suffixIconRegister),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'register_confirm_password'.tr(context),
                          style: Theme.of(context).textTheme.bodyText2,
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
                          onSubmit: (value) {
                            registerSubmit();
                          },
                          controller: passwordConfirmController,
                          type: TextInputType.visiblePassword,
                          isPassword: cubit.isPasswordConfirmRegister,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeSuffixIconConfirmRegister();
                            },
                            icon: Icon(cubit.suffixIconConfirmRegister),
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      myMaterialButton(
                          context: context,
                          onPressed: () {
                            registerSubmit();
                          },
                          label: 'register_button'.tr(context)),
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
            )),
          ),
        );
      },
    );
  }

  String generateCountryFlag() {
    String countryCode = "eg";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  void registerSubmit() {
    if (dropdownValue == null) {
      setState(() {
        typeValidate = "register_gender_valid".tr(context);
      });
    }
    if (dropdownValue != null) {
      setState(() {
        typeValidate = " ";
      });
    }
    if (formKey.currentState!.validate() && dropdownValue != null) {
      CacheHelper.saveData(key: 'uId', value: "45454545645666").then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('register_snackBar'.tr(context))));
        Navigator.of(context).popUntil((route) => route.isFirst);
        NavigateToReb(context: context, widget: const SplashScreen());
      });
    }
  }
}
