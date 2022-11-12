import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/dialogs/policy_dialog.dart';
import 'package:es3fny_user_app/layout/layout_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    'ذكر',
    'انثي',
  ];
  String? dropdownValue;

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
                Icons.arrow_circle_left_outlined,
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
                        'إنشاء حساب',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 32,
                            ),
                      ),
                      SizedBox(
                        height: size.height * 0.0346,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'الإسم بالكامل',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                        validate: (value) {
                          if (value!.length < 8) {
                            return "برجاء ادخال الاسم رباعي";
                          }
                          return null;
                        },
                        context: context,
                        textAlign: TextAlign.right,
                        type: TextInputType.text,
                        onSubmit: (value) {},
                        controller: nameController,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'رقم الهاتف',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      phoneTextFormField(
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
                        type: TextInputType.number,
                        onSubmit: (value) {},
                        maxLength2: 10,
                        controller: phoneController,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'النوع',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      Container(
                        height: 47,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: myFavColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(20),
                              isExpanded: true,
                              hint: Text(
                                "اختر",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: myFavColor2),
                              ),
                              value: dropdownValue,
                              underline: const SizedBox(),
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              style: TextStyle(
                                color: myFavColor4,
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(value)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top: 8.0,start: 9.0),
                          child: Text(
                            typeValidate,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.red[700]),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'العمر',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      phoneTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "برجاء ادخال عمرك";
                          }
                          return null;
                        },
                        context: context,
                        maxLength2: 2,
                        textAlign: TextAlign.right,
                        type: TextInputType.number,
                        onSubmit: (value) {},
                        controller: ageController,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'البريد الإكتروني',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                        validate: (value) {
                          if (!value!.contains("@")) {
                            return "بريد الكتروني غير صالح";
                          }
                          return null;
                        },
                        context: context,
                        textAlign: TextAlign.left,
                        onSubmit: (value) {},
                        controller: emailController,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: size.height * 0.0219,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'كلمة المرور',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                        validate: (value) {
                          if (value!.length < 8) {
                            return "يجب الا تقل كلمة المرور عن 8 أحرف";
                          }
                          return null;
                        },
                        context: context,
                        textAlign: TextAlign.right,
                        onSubmit: (value) {},
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPasswordRegister,
                        prefixIcon: IconButton(
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
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'تأكيد كلمة المرور',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      myTextFormField(
                          validate: (value) {
                            if (value != passwordController.text) {
                              return "يجب ان تطابق كلمتي المرور";
                            }
                            return null;
                          },
                          context: context,
                          textAlign: TextAlign.right,
                          onSubmit: (value) {
                            registerSubmit();
                          },
                          controller: passwordConfirmController,
                          type: TextInputType.visiblePassword,
                          isPassword: cubit.isPasswordConfirmRegister,
                          prefixIcon: IconButton(
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
                          label: 'إنشاء'),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "من خلال إنشاء حساب، فإنك توافق على\n",
                          style: Theme.of(context).textTheme.caption,
                          children: [
                            TextSpan(
                                text: "الشروط & الأحكام ",
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
                              text: "و ",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            TextSpan(
                                text: "وسياسة الخصوصية",
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

  void registerSubmit(){
    if(dropdownValue == null){
      setState(() {
        typeValidate = "برجاء اختيار النوع";
      });
    }
    if(dropdownValue != null){
      setState(() {
        typeValidate = "";
      });
    }
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Text('تم انشاء حسابك بنجاح'))));
      Navigator.of(context).popUntil((route) => route.isFirst);
      NavigateToReb(
          context: context, widget: const LayoutScreen());
    }
  }
}
