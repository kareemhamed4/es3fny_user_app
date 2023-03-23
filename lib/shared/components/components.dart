import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

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
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
      decoration: InputDecoration(
        hintText: hint ?? '',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 16, color: myFavColor5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );

Widget myMaterialButton({
  required BuildContext context,
  required Function onPressed,
  Widget? labelWidget,
  bool isEnabled = true,
}) =>
    MaterialButton(
      onPressed: () {
        isEnabled ? onPressed() : null;
      },
      color: isEnabled ? myFavColor : myFavColor.withOpacity(0.4),
      minWidth: double.infinity,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: labelWidget,
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
              .bodyText1!
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
                  .bodyText1!
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

Widget myDivider({double? paddingValue}) => Padding(
      padding: EdgeInsets.only(
        right: paddingValue ?? 12,
        left: paddingValue ?? 12,
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
  String? hint,
}) =>
    TextFormField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
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
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconColor: Colors.grey,
        icon: icon,
        hintText: hint ?? '',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 16, color: myFavColor5),
      ),
    );

void displaySuccessMotionToast({
  required BuildContext context,
  String? title,
  String? description,
}) =>
    MotionToast.success(
      title: Text(
        title ?? "",
        style: TextStyle(color: myFavColor3, fontWeight: FontWeight.bold),
      ),
      description: Text(
        description ?? "",
        style: TextStyle(color: myFavColor3, fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: true,
    ).show(context);

void displayErrorMotionToast({
  required BuildContext context,
  String? title,
  String? description,
}) =>
    MotionToast.error(
      title: Text(
        title ?? "",
        style: TextStyle(color: myFavColor3, fontWeight: FontWeight.bold),
      ),
      description: Text(
        description ?? "",
        style: TextStyle(color: myFavColor3, fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.ltr,
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
    ).show(context);

void displayWarningMotionToast({
  required BuildContext context,
  String? title,
  String? description,
}) =>
    MotionToast.warning(
      title: Text(
        title ?? "",
        style: TextStyle(color: myFavColor3, fontWeight: FontWeight.bold),
      ),
      description: Text(
        description ?? "",
        style: TextStyle(color: myFavColor3, fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.ltr,
      position: MotionToastPosition.top,
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(context);

void showMyDialog({
  required BuildContext context,
  IconData? icon,
  required Function onConfirm,
  Widget? contentWidget,
  Widget? titleWidget,
  Key? formKey,
}) {
  showDialog<String>(
    context: context,
    builder: (dialogContext) => Form(
      key: formKey,
      child: Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            icon: Icon(
              icon ?? Icons.info_outline,
              color: myFavColor,
            ),
            backgroundColor: Theme.of(context).cardColor,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            title: titleWidget ?? const SizedBox(),
            content: contentWidget ?? const SizedBox(),
            actions: <Widget>[
              MaterialButton(
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
                child: Text(
                  "alert_cancel".tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: myFavColor, fontSize: 20),
                ),
              ),
              MaterialButton(
                color: myFavColor,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {
                  onConfirm();
                },
                child: Text(
                  "alert_confirm".tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget myDropDownButton({
  required BuildContext context,
  required List<String> dropMenuItems,
  required String selectedValue,
  String? validateText,
  Widget? prefix,
  required String hintText,
  required bool isRegisterForm,
  void Function(String?)? onChange,
  String Function(String?)? validator,
}) =>
    DropdownButtonFormField2(
      decoration: InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderSide:
              isRegisterForm ? BorderSide(color: myFavColor) : BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        border: OutlineInputBorder(
          borderSide:
              isRegisterForm ? BorderSide(color: myFavColor) : BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: myFavColor5, fontSize: 16),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: Row(
        children: [
          if (prefix != null) prefix,
          if (prefix != null)
            const SizedBox(
              width: 6,
            ),
          Text(
            hintText.tr(context),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: myFavColor5, fontSize: 16),
          ),
        ],
      ),
      style: Theme.of(context).textTheme.bodyText2,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
      ),
      iconSize: 25,
      buttonHeight: isRegisterForm ? 54 : 44,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
      ),
      items: dropMenuItems
          .map((item) => DropdownMenuItem<String>(
                value: item.tr(context),
                onTap: () {
                  selectedValue = item.tr(context);
                },
                child: Text(
                  item.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 18),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return validateText?.tr(context);
        }
        return null;
      },
      onChanged: onChange,
      onSaved: (value) {
        selectedValue = value.toString();
      },
    );

Widget mySearchDropDownButton({
  required BuildContext context,
  required String hintText,
  required List<String> searchItems,
  String? selectedSearchValue,
  required TextEditingController searchTextEditingController,
}) =>
    DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: myFavColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton2(
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black45,
          ),
          iconSize: 30,
          buttonPadding: const EdgeInsets.symmetric(horizontal: 16),
          isExpanded: true,
          hint: Text(
            hintText.tr(context),
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: searchItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedSearchValue,
          onChanged: (value) {
            // set state required to change
            selectedSearchValue = value as String;
          },
          buttonHeight: 48,
          buttonWidth: double.infinity,
          itemHeight: 48,
          dropdownMaxHeight: 250,
          searchController: searchTextEditingController,
          searchInnerWidget: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              controller: searchTextEditingController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Search for an item...',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return (item.value.toString().contains(searchValue));
          },
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              searchTextEditingController.clear();
            }
          },
        ),
      ),
    );

Future<dynamic> showMyBottomSheet({
  required BuildContext context,
  required Widget child,
}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black38,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return child;
      },
    );
