import 'package:es3fny_user_app/modules/create_new_password/newpassword.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("تحقق من الهاتف",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 32,
                        )),
                SizedBox(
                  height: size.height * 0.184,
                ),
                Text(
                  "ادخل رمز التأكيد",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 24, color: myFavColor4),
                ),
                SizedBox(
                  height: size.height * 0.063,
                ),
                PinCodeTextField(
                  appContext: context,
                  autoFocus: true,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    borderWidth: 1,
                    activeColor: myFavColor,
                    inactiveColor: myFavColor,
                    inactiveFillColor: Colors.white,
                    activeFillColor: myFavColor.withOpacity(0.2),
                    selectedColor: myFavColor,
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  onCompleted: (value) {
                    otpCode = value;
                    if (kDebugMode) {
                      print("Completed");
                    }
                  },
                  onChanged: (value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                ),
                SizedBox(
                  height: size.height * 0.087,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("اذا لم يتم ارسال لك الرمز!"),
                      myTextButton(
                          context: context,
                          label: "إعادة ارسال",
                          onPressed: () {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.029,
                ),
                myMaterialButton(
                  context: context,
                  onPressed: () {
                    NavigateTo(context: context, widget: NewPassword());
                  },
                  label: "تأكيد",
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
