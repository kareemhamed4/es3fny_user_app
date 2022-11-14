import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class EditLocationScreen extends StatelessWidget {
  EditLocationScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  String label = "تأكيد";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        /*showMyBottomSheet(context: context, size: size);*/
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            "تغيير الموقع",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: myFavColor),
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
                    showMyBottomSheet(context: context, size: size);
                  },
                  onTap: () {
                    showMyBottomSheet(context: context, size: size);
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
                          color: myFavColor2.withOpacity(0.5),
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

  void showMyBottomSheet({required BuildContext context, required Size size}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.white,
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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "اختر مكانك",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: locationController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يجب ادخال موقعك الحالي";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: myFavColor2.withOpacity(0.1),
                          contentPadding: const EdgeInsets.only(right: 8),
                          label: Text(
                            "ادخل موقعك الحالي",
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
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "المكان المقصود (اختياري)",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: hospitalController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: myFavColor2.withOpacity(0.1),
                          contentPadding: const EdgeInsets.only(right: 8),
                          label: Text(
                            "اسم المستشفي",
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
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          height: 40,
                          minWidth: 178,
                          color: myFavColor,
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              hospitalController.text = hospitalController.text;
                              locationController.text = locationController.text;
                            }
                          },
                          child: Text(
                            "تغيير",
                            style:
                            Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
