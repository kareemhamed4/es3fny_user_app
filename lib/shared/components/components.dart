import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  final Function onTap;
  Function? suffixPressed;
  ValueChanged<String>? onSubmit;
  ValueChanged<String>? onChange;
  final TextEditingController controller;
  final TextInputType type;
  FormFieldValidator<String>? validator;
  final double? radius;
  final IconData? prefix;
  final IconData? suffix;
  String? label;
  bool isPassword;
  bool enabled;
  MyTextFormField(
      {required this.controller,
      required this.type,
      required this.validator,
      required this.onTap,
      this.suffixPressed,
      this.onSubmit,
      this.onChange,
      this.radius = 10.0,
      this.prefix,
      this.label = '',
      this.suffix,
      this.isPassword = false,
      this.enabled = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        onTap: () {
          onTap();
        },
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        controller: controller,
        keyboardType: type,
        enabled: enabled,
        obscureText: isPassword,
        validator: (value) {
          if (value!.isEmpty) {
            return "$label must not be empty";
          }
          return null;
        },
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        cursorHeight: 20,
        style: Theme.of(context).textTheme.subtitle2,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.black54),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 1,color: myFavColor)
          ),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              borderSide: BorderSide(width: 1,color: myFavColor)
          ),
          floatingLabelStyle: const TextStyle(color: Colors.brown),

          prefixIcon: Icon(
            prefix,
            color: Colors.redAccent,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              suffix,
              color: Colors.redAccent,
            ),
            onPressed: () {
              suffixPressed;
            },
          ),
          label: Text(
            label!,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}