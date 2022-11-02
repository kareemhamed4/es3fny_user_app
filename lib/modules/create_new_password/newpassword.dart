import 'package:es3fny_user_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text("إنشاء كلمة مرور جديدة",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 32,
                          )),
                  SizedBox(
                    height: size.height * 0.201,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'إدخل كلمة المرور الجديدة',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    validate: (value){
                      if(value!.length < 8){
                        return "كلمة المرور يجب الا تقل عن 8 أحرف";
                      }
                      return null;
                    },
                    textAlign: TextAlign.right,
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.visibility_off_outlined),
                    context: context,
                    controller: passwordController,
                    onSubmit: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.0123,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'تأكيد كلمة المرور',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    validate: (value){
                      if(value != passwordController.text){
                        return "يجب ان تطابق كلمتي المرور";
                      }
                      return null;
                    },
                    textAlign: TextAlign.right,
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.visibility_off_outlined),
                    context: context,
                    controller: passwordConfirmController,
                    onSubmit: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.123,
                  ),
                  myMaterialButton(
                    context: context,
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        NavigateTo(context: context, widget: const OnBoardingScreen());
                      }
                    },
                    label: "تأكيد",
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
