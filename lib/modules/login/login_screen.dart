import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/layout/layout_screen.dart';
import 'package:es3fny_user_app/modules/forget_password/forget_password_screen.dart';
import 'package:es3fny_user_app/modules/register/register_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

//ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("تسجيل الدخول",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 30,
                                color: myFavColor
                                  )),
                          SizedBox(
                            height: size.height * 0.064,
                          ),
                          const Image(
                            image: AssetImage(
                              "assets/images/juicy-online-doctor-consultation 1.png",
                            ),
                            width: 180,
                            height: 180,
                          ),
                          SizedBox(
                            height: size.height * 0.065,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'رقم الهاتف',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: InternationalPhoneNumberInput(
                              countries: const ["EG"],
                              spaceBetweenSelectorAndTextField: 20,
                              selectorTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
                              textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
                              maxLength: 12,
                              validator: (value) {
                                if (value!.length < 12) {
                                  return "رقم هاتف غير صحيح";
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
                              textAlign: TextAlign.right,
                              maxLength2: 11,
                              type: TextInputType.number,
                              context: context,
                              controller: phoneController,
                              onSubmit: (value) {}),
                          const SizedBox(
                            height: 7,
                          ),*/
                          const SizedBox(
                            height: 7,
                          ),
                          Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'كلمة المرور',
                                style: Theme.of(context).textTheme.bodyText2,
                              )),
                          const SizedBox(
                            height: 7,
                          ),
                          myTextFormField(
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                              return null;
                            },
                            type: TextInputType.visiblePassword,
                            isPassword: cubit.isPasswordLogin,
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeSuffixIconLogin();
                              },
                              icon: Icon(cubit.suffixIconLogin),
                            ),
                            context: context,
                            controller: passwordController,
                            onSubmit: (value) {
                              loginSubmit(context: context);
                            },
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: myTextButton(
                                  context: context,
                                  label: "هل نسيت كلمة المرور؟",
                                  onPressed: () {
                                    NavigateTo(
                                        context: context,
                                        widget: ForgetPasswordScreen());
                                  })),
                          SizedBox(
                            height: size.height * 0.042,
                          ),
                          myMaterialButton(
                            context: context,
                            onPressed: () {
                              loginSubmit(context: context);
                            },
                            label: "دخول",
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Row(
                            children: [
                              const Text("هل لديك حساب؟"),
                              myTextButton(
                                  context: context,
                                  label: "إنشاء حساب",
                                  onPressed: () {
                                    NavigateTo(
                                      context: context,
                                      widget: const Register(),
                                    );
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
  void loginSubmit({required BuildContext context,}){
    if (formKey.currentState!.validate()) {
      CacheHelper.saveData(key: 'uId', value: "45454545645666").then((value){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Directionality(
              textDirection: TextDirection.rtl,
              child: Text('تم تسجيل دخولك بنجاح'),
            ),
          ),
        );
        Navigator.of(context)
            .popUntil((route) => route.isFirst);
        NavigateToReb(
            context: context,
            widget: const LayoutScreen());
      });
    }
  }
}
