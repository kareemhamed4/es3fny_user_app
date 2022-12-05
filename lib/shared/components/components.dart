import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget myTextFormField({
  required BuildContext context,
  TextEditingController? controller,
  TextInputType? type,
  bool? isPassword,
  Function? onTap,
  ValueChanged<String>? onChange,
  String? Function(String?)? validate,
  ValueChanged<String>? onSubmit,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Widget? icon,
  int? maxLength,
  int? maxLength2,
  TextAlign? textAlign,
  String? hint,
}) =>
    TextFormField(
      obscuringCharacter: '●',
      controller: controller,
      cursorColor: Colors.black54,
      keyboardType: type,
      obscureText: isPassword ?? false,
      onTap: () {
        onTap;
      },
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      textAlign: textAlign ?? TextAlign.start,
      maxLength: maxLength,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength2),
      ],
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18,fontFamily: "FinalR"),
      decoration: InputDecoration(
        hintText: hint ?? '',
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1,
            color: myFavColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1,
            color: myFavColor.withOpacity(0.5),
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconColor: Colors.grey,
        icon: icon,
      ),
    );

Widget myMaterialButton({
  required BuildContext context,
  required Function onPressed,
  String? label,
}) =>
    MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: myFavColor,
      minWidth: double.infinity,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label ?? '',
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );

Widget myTextButton({
  required BuildContext context,
  required String label,
  required Function onPressed,
}) =>
    TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: myFavColor),
        ));

Widget onBoardingMaterialButton({
  required BuildContext context,
  required Function onPressed,
  required String label,
}) =>
    SizedBox(
      width: 264,
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        color: myFavColor,
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 6,
            ),
            const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );

// ignore: non_constant_identifier_names
Future NavigateToReb({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));

// ignore: non_constant_identifier_names
Future NavigateTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget myDivider() => Padding(
      padding: const EdgeInsets.only(
        right: 12,
        left: 12,
        top: 0,
        bottom: 0,
      ),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        height: 1,
      ),
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget phoneTextFormField({
  required BuildContext context,
  TextEditingController? controller,
  TextInputType? type,
  bool? isPassword,
  Function? onTap,
  required String? Function(String?) validate,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Widget? icon,
  int? maxLength,
  int? maxLength2,
  TextAlign? textAlign,
}) =>
    TextFormField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      cursorColor: Colors.black54,
      keyboardType: type,
      obscureText: isPassword ?? false,
      onTap: () {
        onTap;
      },
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      textAlign: textAlign ?? TextAlign.start,
      maxLength: maxLength,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength2),
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18,fontFamily: "FinalR"),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1,
            color: myFavColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1,
            color: myFavColor.withOpacity(0.5),
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconColor: Colors.grey,
        icon: icon,
      ),
    );
