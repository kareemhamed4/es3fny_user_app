import 'package:es3fny_user_app/models/services_model.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class HelpServicesScreen extends StatelessWidget {
  HelpServicesScreen({Key? key}) : super(key: key);

  List<ServicesModel> services = [
    ServicesModel(
      imagePath: "assets/images/predict 1.png",
      label: "التنبؤ ببعض الأمراض",
    ),
    ServicesModel(
      imagePath: "assets/images/notification-bell 1.png",
      label: "ذَكّرني",
    ),
    ServicesModel(
      imagePath: "assets/images/first-aid-box 1.png",
      label: "الإسعافات الأولية",
    ),
    ServicesModel(
      imagePath: "assets/images/hospital 1.png",
      label: "أقرب مستشفي",
    ),
    ServicesModel(
      imagePath: "assets/images/clipboard 1.png",
      label: "أقرب عيادة",
    ),
    ServicesModel(
      imagePath: "assets/images/medicine 1.png",
      label: "أقرب صيدلية",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "الخدمات",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: myFavColor),
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
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: myFavColor.withOpacity(0.5),
            onTap: () {},
            child: SizedBox(
              height: size.height * 0.11,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.white,
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
                            model.label,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: myFavColor,
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
