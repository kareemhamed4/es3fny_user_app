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

  final List<String> genderItems = [
    'male',
    'female',
  ];
  String? selectedValue;

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
  final TextEditingController searchTextEditingController = TextEditingController();

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
                          inputDecoration:const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                          ),
                          selectorConfig: const SelectorConfig(
                            setSelectorButtonAsPrefixIcon: true,
                            leadingPadding: 16,
                          ),
                        ),
                      ),
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
                      myDropDownButton(
                          context: context,
                          dropMenuItems: genderItems,
                          selectedValue: selectedValue,
                          validateText: "register_gender_valid",
                          hintText: "register_gender_choose"
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
                          icon: Icon(cubit.suffixIconRegister,color: Theme.of(context).iconTheme.color,),
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
                            icon: Icon(cubit.suffixIconConfirmRegister,color: Theme.of(context).iconTheme.color,),
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
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      CacheHelper.saveData(key: 'uId', value: "45454545645666").then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('register_snackBar'.tr(context))));
        Navigator.of(context).popUntil((route) => route.isFirst);
        NavigateToReb(context: context, widget: const SplashScreen());
      });
    }
  }
}
