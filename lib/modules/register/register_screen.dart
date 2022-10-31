import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  context: context,
                  textAlign: TextAlign.right,
                  type: TextInputType.text,
                  onSubmit: () {},
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
                myTextFormField(
                  textAlign: TextAlign.left,
                  context: context,
                  maxLength2: 10,
                  icon: Text(
                    "${generateCountryFlag()}  +20",
                    style: const TextStyle(fontSize: 20),
                  ),
                  type: TextInputType.number,
                  controller: phoneController,
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
                  context: context,
                  textAlign: TextAlign.left,
                  onSubmit: () {},
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: size.height * 0.0219,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'كلمه المرور',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.008,
                ),
                myTextFormField(
                    context: context,
                    textAlign: TextAlign.right,
                    onSubmit: () {},
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.remove_red_eye)),
                SizedBox(
                  height: size.height * 0.0219,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'تأكيد كلمه المرور',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.008,
                ),
                myTextFormField(
                    context: context,
                    textAlign: TextAlign.right,
                    onSubmit: () {},
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.remove_red_eye)),
                SizedBox(
                  height: size.height * 0.126,
                ),
                myMaterialButton(
                    context: context, onPressed: () {}, label: 'إنشاء')
              ],
            ),
          ),
        )),
      ),
    );
  }

  String generateCountryFlag() {
    String countryCode = "eg";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
