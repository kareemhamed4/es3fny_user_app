import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class HelpServicesScreen extends StatelessWidget {
  const HelpServicesScreen({Key? key}) : super(key: key);

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
                imagePath: "assets/images/applogo.png",
                label: "التنبؤ ببعض الأمراض"),
            separatorBuilder: (context, index) => SizedBox(
                  height: size.height * 0.0216,
                ),
            itemCount: 6),
      ),
    );
  }

  Widget buildServicesItem({
    required BuildContext context,
    required String imagePath,
    required String label,
  }) =>
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        imagePath,
                        width: 75,
                        height: 75,
                      ),
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodyText1,
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
      );
}
