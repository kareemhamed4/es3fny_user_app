import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/otp/otp_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

//ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget{
  ForgetPasswordScreen({super.key});
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "forget_password".tr(context),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: myFavColor,fontSize: 32),
                    ),
                    SizedBox(height: size.height*0.084,),
                    Text(
                      "enter_phone".tr(context),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: myFavColor4,fontSize: 20),
                    ),
                    SizedBox(height: size.height*0.002,),
                    Text(
                      "enter_phone_caption_1".tr(context),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: myFavColor2,fontSize: 16),
                    ),
                    Text(
                      "enter_phone_caption_2".tr(context),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: myFavColor2,fontSize: 16),
                    ),
                    SizedBox(height: size.height*0.0703,),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "forget_phone".tr(context),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: size.height*0.00922,),
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
                            return "forget_phone_valid".tr(context);
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
                      validate: (value){
                        if(value!.isEmpty){
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 10, end: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(generateCountryFlag(),style: const TextStyle(fontSize: 18),),
                            const SizedBox(width: 6,),
                            const Text("+20",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ),
                      context: context,
                      textAlign: TextAlign.left,
                      type: TextInputType.number,
                      onSubmit: (value) {},
                      maxLength2: 10,
                      controller: phoneController,
                    ),*/
                    SizedBox(height: size.height*0.023,),
                    InkWell(
                      onTap: (){
                        NavigateTo(context: context, widget: LoginScreen());
                      },
                      child: Text(
                        "forget_phone_caption".tr(context),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: myFavColor2),
                      ),
                    ),
                    SizedBox(height: size.height*0.101,),
                    myMaterialButton(
                        context: context,
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('otp_snackBar'.tr(context))));
                            NavigateTo(context: context, widget: const OTPScreen());
                          }
                        },
                      label: "send_button".tr(context)
                    ),
                  ],
                ),
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