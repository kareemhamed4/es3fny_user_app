import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/models/services_model.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class HelpServicesScreen extends StatelessWidget {
  HelpServicesScreen({Key? key}) : super(key: key);

  List<ServicesModel> services = [
    ServicesModel(
      imagePath: "assets/images/predict 1.png",
      label: "prediction",
    ),
    ServicesModel(
      imagePath: "assets/images/notification-bell 1.png",
      label: "notify",
    ),
    ServicesModel(
      imagePath: "assets/images/first-aid-box 1.png",
      label: "first_aid",
    ),
    ServicesModel(
      imagePath: "assets/images/hospital 1.png",
      label: "hospital",
    ),
    ServicesModel(
      imagePath: "assets/images/clipboard 1.png",
      label: "clinic",
    ),
    ServicesModel(
      imagePath: "assets/images/medicine 1.png",
      label: "pharmacy",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "services".tr(context),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.separated(
            itemBuilder: (context, index) => buildServicesItem(
                  context: context,
                  model: services[index],
                  size: size,
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: size.height * 0.0216,
                ),
            itemCount: services.length),
      ),
    );
  }

  Widget buildServicesItem({
    required ServicesModel model,
    required BuildContext context,
    required Size size,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          highlightColor: myFavColor.withOpacity(0.5),
          onTap: () {},
          child: SizedBox(
            height: size.height * 0.11,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          model.imagePath,
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 25,),
                        Text(
                          model.label.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
