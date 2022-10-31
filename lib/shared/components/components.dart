import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget myTextFormField({
  required BuildContext context,
  TextEditingController? controller,
  TextInputType? type,
  bool? isPassword,
  Function? onTap,
  Function? onChange,
  Function? onSubmit,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Widget? icon,
  int? maxLength,
  int? maxLength2,
  required TextAlign textAlign,
}) => TextFormField(
  controller: controller,
  cursorColor: Colors.black54,
  keyboardType: type,
  obscureText: isPassword ?? false,
  onTap: (){
    onTap;
  },
  onChanged: (value){
    onChange;
  },
  onFieldSubmitted: (value){
    onSubmit;
  },
  validator: (value){
    if(value!.isEmpty){
      return "value must not be empty";
    }
    return null;
  },
  textAlign: textAlign,
  maxLength: maxLength,
  inputFormatters: [LengthLimitingTextInputFormatter(maxLength2)],
  style: Theme.of(context).textTheme.bodyText1,
  decoration: InputDecoration(
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
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    icon: icon,
  ),
);

Widget myMaterialButton({
  required BuildContext context,
  required Function onPressed,
  String? label,
}) => MaterialButton(
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
    style: Theme.of(context).textTheme.button!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600
    ),
  ),
);

Widget myTextButton({
  required BuildContext context,
  required String label,
  required Function onPressed,
}) => TextButton(
    onPressed: (){
      onPressed();
    },
    child: Text(
      label,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor),
    )
);

Widget onBoardingMaterialButton({
  required BuildContext context,
  required Function onPressed,
  required String label,
}) => SizedBox(
  width: 264,
  child:   MaterialButton(
    onPressed: () {
      onPressed();
    },
    color: myFavColor,
    height: 40,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          const Icon(Icons.arrow_circle_left_outlined,color: Colors.white,size: 20,)
        ],
      ),
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
  padding: const EdgeInsets.only(right: 0,left: 0,top: 10,bottom: 10,),
  child: Container(
    width: double.infinity,
    color: Colors.grey[300],
    height: 1,
  ),
);

