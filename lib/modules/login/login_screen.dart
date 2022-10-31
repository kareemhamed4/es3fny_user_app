import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:flutter/material.dart';
//ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("تسجيل الدخول",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 32,
                          )),
                  const SizedBox(
                    height: 56,
                  ),
                  const Image(
                      image: AssetImage(
                          "assets/images/juicy-online-doctor-consultation 1.png")),
                  const SizedBox(
                    height: 57,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'رقم الهاتف',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  myTextFormField(
                      type: TextInputType.number,
                      context: context,
                      controller: phoneController,
                      onSubmit: () {}),
                  const SizedBox(
                    height: 7,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'كلمة المرور',
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                  const SizedBox(
                    height: 7,
                  ),
                  myTextFormField(
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      suffixIcon: const Icon(Icons.visibility_off_outlined),
                      context: context,
                      controller: passwordController,
                      onSubmit: () {}),
                  const SizedBox(
                    height: 6,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: myTextButton(
                          context: context,
                          label: "هل نسيت كلمة المرور؟",
                          onPressed: () {})),
                  const SizedBox(
                    height: 20,
                  ),
                  myMaterialButton(
                    context: context,
                    onPressed: () {},
                    label: "دخول",
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Text("هل لديك حساب؟"),
                        myTextButton(
                            context: context,
                            label: "إنشاء حساب",
                            onPressed: () {}),
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
  }
}
