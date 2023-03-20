import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/add_treatment/add_treatment_Screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotifyMeScreen extends StatelessWidget {
  const NotifyMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "notify".tr(context),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 12,),
              myDivider(
                paddingValue: 0,
              ),
              const SizedBox(height: 60,),
              SvgPicture.asset("assets/images/bellIcon.svg"),
              const SizedBox(height: 60,),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index) => buildTreatmentItem(context: context),
                  separatorBuilder: (context,index) => const SizedBox(height: 30,),
                  itemCount: 4
              ),
              //SvgPicture.asset("assets/images/pill2.svg"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NavigateTo(context: context, widget: const AddTreatmentScreen());
        },
        backgroundColor: myFavColor,
        child: Icon(Icons.add,color: myFavColor9,),
      ),
    );
  }
  Widget buildTreatmentItem({
    required BuildContext context,
}) => SizedBox(
    width: double.infinity,
    height: 74,
    child: Card(
      margin: EdgeInsets.zero,
      color: myFavColor10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/pill.svg",height: 40,width: 40,),
                const SizedBox(width: 16,),
                Text(
                  "بانادول",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor,fontSize: 20),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined,color: myFavColor1),
          ],
        ),
      ),
    ),
  );
}
