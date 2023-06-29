import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/responsive.dart';
import 'package:es3fny_user_app/shared/components/my_google_map.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class EditLocationScreen extends StatefulWidget {
  const EditLocationScreen({Key? key}) : super(key: key);

  @override
  State<EditLocationScreen> createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  String label = "تأكيد";

  double sheetHeight = 100.0;
  bool isSheetExpanded = false;
  void onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      sheetHeight -= details.primaryDelta!;
      if (sheetHeight < 80) {
        sheetHeight = 80;
        isSheetExpanded = false;
      } else if (sheetHeight > 250) {
        sheetHeight = 250;
        isSheetExpanded = true;
      }
    });
  }

  @override
  void initState() {
    currentLocationAsString = CacheHelper.getData(key: "currentLocation");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        title: Text(
          "edit_location".tr(context),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
        ),
        centerTitle: true,
      ),*/
      body: SafeArea(
        child: Responsive(
          mobile: buildMobileEditLocationScreen(context),
          desktop: buildMobileEditLocationScreen(context),
          tablet: buildMobileEditLocationScreen(context),
        ),
      ),
    );
  }

  Widget buildMobileEditLocationScreen(BuildContext context) {
    return currentLocation == null
        ? Center(
            child: Text(
              "Loading",
              style: Theme.of(context).textTheme.caption,
            ),
          )
        : Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              const MyGoogleMap(
                isGoToMyLocationEnabled: false,
                isTracking: false,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onVerticalDragUpdate: onVerticalDragUpdate,
                  onVerticalDragEnd: (_) {
                    setState(() {
                      if (sheetHeight > 130) {
                        sheetHeight = 250;
                        isSheetExpanded = true;
                      } else {
                        sheetHeight = 80;
                        isSheetExpanded = false;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    height: sheetHeight,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "تغيير المكان المقصود",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 22,
                                    ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 30),
                                      Text(
                                        "destination_location".tr(context),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: hospitalController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: myFavColor1.withOpacity(0.1),
                                          contentPadding:
                                          const EdgeInsets.only(right: 8, left: 8),
                                          label: Text(
                                            "destination_location_2".tr(context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(fontSize: 14),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: MaterialButton(
                                          height: 40,
                                          minWidth: 178,
                                          color: myFavColor,
                                          onPressed: () {
                                            if (formKey.currentState!.validate()) {
                                              hospitalController.text = hospitalController.text;
                                              locationController.text = locationController.text;
                                            }
                                          },
                                          child: Text(
                                            "edit_location_button".tr(context),
                                            style: Theme.of(context).textTheme.button,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  void showMyBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        barrierColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              right: 13,
              left: 13,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                          color: myFavColor1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "pick_location".tr(context),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: locationController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "pick_location_validate".tr(context);
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: myFavColor1.withOpacity(0.1),
                        contentPadding:
                            const EdgeInsets.only(right: 8, left: 8),
                        label: Text(
                          "pick_location_2".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "destination_location".tr(context),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: hospitalController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: myFavColor1.withOpacity(0.1),
                        contentPadding:
                            const EdgeInsets.only(right: 8, left: 8),
                        label: Text(
                          "destination_location_2".tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        height: 40,
                        minWidth: 178,
                        color: myFavColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            hospitalController.text = hospitalController.text;
                            locationController.text = locationController.text;
                          }
                        },
                        child: Text(
                          "edit_location_button".tr(context),
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
