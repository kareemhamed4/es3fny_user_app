import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddTreatmentScreen extends StatelessWidget {
  const AddTreatmentScreen({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              myDivider(
                paddingValue: 0,
              ),
              const SizedBox(height: 30,),
              Text(
                "اسم الدواء",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 44,
                width: double.infinity,
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
                            SvgPicture.asset("assets/images/pill.svg",height: 20,width: 20,),
                            const SizedBox(width: 16,),
                            Text(
                              "بانادول",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Icon(Icons.camera_alt_outlined,color: myFavColor),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                "الكمية والمدة",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor),
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: myFavColor10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide.none,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/images/pill2.svg",height: 20,width: 20,),
                                  const SizedBox(width: 16,),
                                  Text(
                                    "2",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_down_outlined,color: myFavColor1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 36,),
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: myFavColor10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide.none,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.edit_calendar_outlined,color: myFavColor1,),
                                  const SizedBox(width: 16,),
                                  Text(
                                    "30",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_down_outlined,color: myFavColor1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              SizedBox(
                width: double.infinity,
                height: 335,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: cardForCalendar,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide.none,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SfDateRangePicker(
                      selectionShape: DateRangePickerSelectionShape.rectangle,
                      selectionColor: myFavColor,
                      backgroundColor: calendarBg,
                      startRangeSelectionColor: myFavColor,
                      selectionMode: DateRangePickerSelectionMode.range,
                      selectionRadius: 0,
                      headerStyle: DateRangePickerHeaderStyle(
                        textAlign: TextAlign.center,
                        backgroundColor: myFavColor,
                        textStyle: Theme.of(context).textTheme.button,
                      ),
                      rangeTextStyle: Theme.of(context).textTheme.bodyText1,
                      enablePastDates: false,
                      initialDisplayDate: DateTime.now(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Text(
                "تنبيه",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: myFavColor),
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: myFavColor10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide.none,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.notifications,color: myFavColor1),
                              const SizedBox(width: 16,),
                              Text(
                                "10:00 AM",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  SizedBox(
                    height: 44,
                    width: 44,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: lightRose,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide.none,
                      ),
                      child: Icon(Icons.add,color: myFavColor,),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48,),
              myMaterialButton(
                  context: context,
                  onPressed: (){},
                  labelWidget: Text(
                    "تم",
                    style: Theme.of(context).textTheme.button,
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
