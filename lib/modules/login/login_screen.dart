import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/forget_password/forget_password_screen.dart';
import 'package:es3fny_user_app/modules/login/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/login/cubit/states.dart';
import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/register/register_screen.dart';
import 'package:es3fny_user_app/modules/splash/splash_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/responsive.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

//ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  late String phoneNumber;
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "loginScaffoldKey");
  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: "loginFormKey");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) => {
              if (state is LoginSuccessState)
                {
                  if (state.loginModel.status!)
                    {
                      CacheHelper.saveData(key: "token", value: state.loginModel.data!.token).then((value) {
                        token = state.loginModel.data!.token;
                        CacheHelper.saveData(key: "isBlind", value: state.loginModel.data!.isBlind).then((value){
                          isBlind = state.loginModel.data!.isBlind!;
                          ProfileCubit.get(context).startLocationUpdates();
                          NavigateToReb(context: context, widget: SplashScreen(isBlind: state.loginModel.data!.isBlind! == 0 ? true : false));
                        });
                      }),
                    }
                  else
                    {
                      displayErrorMotionToast(
                        context: context,
                        title: "خطأ",
                        description: "${state.loginModel.msg}",
                      ),
                    }
                }
            },
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of(context);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(
              child: Responsive(
                mobile: buildMobileLoginScreen(context, size, cubit, state),
                desktop: buildDesktopLoginScreen(context, size, cubit, state),
                tablet: buildDesktopLoginScreen(context, size, cubit, state),
              ),
            ),
          );
        });
  }

  Padding buildDesktopLoginScreen(BuildContext context, Size size, LoginCubit cubit, LoginStates state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "login_label".tr(context),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30, color: myFavColor),
                      ),
                      SizedBox(
                        height: size.height * 0.064,
                      ),
                      SizedBox(
                        height: size.height * 0.065,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'login_phone'.tr(context),
                          style: Theme.of(context).textTheme.bodyText1,
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
                          selectorTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                          maxLength: 12,
                          validator: (value) {
                            if (value!.length < 12) {
                              return "login_phone_valid".tr(context);
                            }
                            return null;
                          },
                          hintText: "1X-XXXX-XXXX",
                          onInputChanged: (PhoneNumber value) {},
                          inputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "1X-XXXX-XXXX",
                            hintStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16, color: myFavColor5),
                          ),
                          selectorConfig: const SelectorConfig(
                            setSelectorButtonAsPrefixIcon: true,
                            leadingPadding: 16,
                          ),
                          onSaved: (phoneNumber) {
                            this.phoneNumber = phoneNumber.phoneNumber!.substring(phoneNumber.phoneNumber!.length - 10);
                            debugPrint(this.phoneNumber);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'login_password'.tr(context),
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      const SizedBox(
                        height: 7,
                      ),
                      myTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "login_password_valid".tr(context);
                          }
                          return null;
                        },
                        hint: '● ● ● ● ● ● ● ●',
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeLoginSuffixIcon();
                          },
                          icon: Icon(
                            cubit.suffixIcon,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        context: context,
                        controller: passwordController,
                        onSubmit: (value) {
                          // to do
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: myTextButton(
                              context: context,
                              label: "login_forget_password".tr(context),
                              onPressed: () {
                                NavigateTo(context: context, widget: ForgetPasswordScreen());
                              })),
                      SizedBox(
                        height: size.height * 0.042,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => myMaterialButton(
                          context: context,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              cubit.userLogin(phone: phoneNumber, password: passwordController.text);
                            }
                          },
                          labelWidget: Text(
                            "login_button".tr(context),
                            style:
                                Theme.of(context).textTheme.button!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
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
                      const SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          Text(
                            "have_account".tr(context),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          myTextButton(
                              context: context,
                              label: "have_account_button".tr(context),
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
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: const [
                      Image(
                        image: AssetImage(
                          "assets/images/new_login.png",
                        ),
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildMobileLoginScreen(BuildContext context, Size size, LoginCubit cubit, LoginStates state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "login_label".tr(context),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30, color: myFavColor),
                ),
                SizedBox(
                  height: size.height * 0.064,
                ),
                const Image(
                  image: AssetImage(
                    "assets/images/new_login.png",
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
                    'login_phone'.tr(context),
                    style: Theme.of(context).textTheme.bodyText1,
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
                    selectorTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                    textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                    maxLength: 12,
                    validator: (value) {
                      if (value!.length < 12) {
                        return "login_phone_valid".tr(context);
                      }
                      return null;
                    },
                    hintText: "1X-XXXX-XXXX",
                    onInputChanged: (PhoneNumber value) {},
                    inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "1X-XXXX-XXXX",
                      hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16, color: myFavColor5),
                    ),
                    selectorConfig: const SelectorConfig(
                      setSelectorButtonAsPrefixIcon: true,
                      leadingPadding: 16,
                    ),
                    onSaved: (phoneNumber) {
                      this.phoneNumber = phoneNumber.phoneNumber!.substring(phoneNumber.phoneNumber!.length - 10);
                      debugPrint(this.phoneNumber);
                    },
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'login_password'.tr(context),
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                const SizedBox(
                  height: 7,
                ),
                myTextFormField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "login_password_valid".tr(context);
                    }
                    return null;
                  },
                  hint: '● ● ● ● ● ● ● ●',
                  type: TextInputType.visiblePassword,
                  isPassword: cubit.isPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changeLoginSuffixIcon();
                    },
                    icon: Icon(
                      cubit.suffixIcon,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  context: context,
                  controller: passwordController,
                  onSubmit: (value) {
                    // to do
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: myTextButton(
                        context: context,
                        label: "login_forget_password".tr(context),
                        onPressed: () {
                          NavigateTo(context: context, widget: ForgetPasswordScreen());
                        })),
                SizedBox(
                  height: size.height * 0.042,
                ),
                ConditionalBuilder(
                  condition: state is! LoginLoadingState,
                  builder: (context) => myMaterialButton(
                    context: context,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        cubit.userLogin(phone: phoneNumber, password: passwordController.text);
                      }
                    },
                    labelWidget: Text(
                      "login_button".tr(context),
                      style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
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
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    Text(
                      "have_account".tr(context),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    myTextButton(
                        context: context,
                        label: "have_account_button".tr(context),
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
    );
  }
}
