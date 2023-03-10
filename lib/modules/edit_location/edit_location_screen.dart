import 'package:es3fny_user_app/app_localization.dart';
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
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((_) {
      showMyBottomSheet(context: context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            "edit_location".tr(context),
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            const SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage("assets/images/Map.png"),
                  fit: BoxFit.cover,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onVerticalDragStart: (start) {
                    showMyBottomSheet(context: context);
                  },
                  onTap: () {
                    showMyBottomSheet(context: context);
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                          color: myFavColor1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                    const  SizedBox(
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
                    const  SizedBox(
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
                        contentPadding: const EdgeInsets.only(right: 8,left: 8),
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
                        contentPadding: const EdgeInsets.only(right: 8,left: 8),
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
