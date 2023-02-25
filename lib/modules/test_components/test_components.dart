import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TestComponents extends StatelessWidget {
  TestComponents({super.key});

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "الإسم بالكامل",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 7,
            ),
            myTextFormField(
              validate: (value) {
                if (value!.isEmpty) {
                  return "Password must not be empty!";
                }
                return null;
              },
              context: context,
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 20,
            ),
            myMaterialButton(
              context: context,
              onPressed: () {},
              labelWidget: Text(
                "تأكيد",
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اذا لم يتم ارسال لك الرمز!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: myFavColor2),
                  ),
                  myTextButton(
                    context: context,
                    label: "إعادة ارسال",
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            onBoardingMaterialButton(
                context: context, onPressed: () {}, label: "البداية")
          ],
        ),
      )),
    );
  }
}
