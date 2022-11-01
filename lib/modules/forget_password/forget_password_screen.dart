import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/otp/otp_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget{
  ForgetPasswordScreen({super.key});
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
          Navigator.pop(context);
        },
            icon: const Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: Theme.of(context).textTheme.headline5!.copyWith(color: myFavColor,fontSize: 32),
                  ),
                  SizedBox(height: size.height*0.084,),
                  Text(
                    "ادخل رقم الهاتف",
                    style: Theme.of(context).textTheme.headline5!.copyWith(color: myFavColor4),
                  ),
                  SizedBox(height: size.height*0.002,),
                  Text(
                    "سوف تصلك رسالة برمز التحقق لاعادة",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor2),
                  ),
                  Text(
                    "تعيين كلمة المرور",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor2),
                  ),
                  SizedBox(height: size.height*0.0703,),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "رقم الهاتف",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: size.height*0.00922,),
                  myTextFormField(
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 8,
                          top: 7,
                          end: 8
                      ),
                      child: Text("${generateCountryFlag()}  +20",style: const TextStyle(fontSize: 18),),
                    ),
                    context: context,
                    textAlign: TextAlign.left,
                    type: TextInputType.number,
                    onSubmit: () {},
                    maxLength2: 10,
                    controller: phoneController,
                  ),
                  SizedBox(height: size.height*0.023,),
                  InkWell(
                    onTap: (){
                      NavigateTo(context: context, widget: LoginScreen());
                    },
                    child: Text(
                      "الرجوع الي تسجيل الدخول",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor2),
                    ),
                  ),
                  SizedBox(height: size.height*0.101,),
                  myMaterialButton(
                      context: context,
                      onPressed: (){
                        NavigateTo(context: context, widget: const OTPScreen()
                        );
                      },
                    label: "إرسال الرمز"
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  String generateCountryFlag() {
    String countryCode = "eg";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'), (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}