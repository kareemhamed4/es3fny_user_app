// ignore_for_file: file_names

import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/notify_me/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/notify_me/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddTreatmentScreen extends StatelessWidget {
  const AddTreatmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotifyMeCubit, NotifyMeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NotifyMeCubit cubit = BlocProvider.of(context);
        DateRangePickerController dateRangePickerController = DateRangePickerController();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "notify".tr(context),
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      myDivider(
                        paddingValue: 0,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "اسم الدواء",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: myFavColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: Theme.of(context).cardColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide.none,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 12,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/pill.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          child: TextFormField(
                                        controller: cubit.treatmentNameController,
                                        validator: (String? treatName) {
                                          if (treatName!.isEmpty) {
                                            return "برجاء ادخال اسم الدواء";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                        style:
                                            Theme.of(context).textTheme.bodyText1,
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Icon(Icons.camera_alt_outlined,
                                        color: myFavColor)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "الكمية والمدة",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: myFavColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: Card(
                                margin: EdgeInsets.zero,
                                color: Theme.of(context).cardColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide.none,
                                ),
                                child: myDropDownButton(
                                    context: context,
                                    prefix: SvgPicture.asset(
                                      "assets/images/pill2.svg",
                                      height: 20,
                                      width: 20,
                                    ),
                                    dropMenuItems: cubit.quantity,
                                    selectedValue: cubit.selectedQuantity ?? "",
                                    hintText:
                                        cubit.selectedQuantity ?? "quantity",
                                    onChange: (value) {
                                      cubit.selectedQuantity = value.toString();
                                    }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 36,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: Card(
                                margin: EdgeInsets.zero,
                                color: Theme.of(context).cardColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide.none,
                                ),
                                child: myDropDownButton(
                                    context: context,
                                    prefix: Icon(
                                      Icons.edit_calendar_outlined,
                                      color: myFavColor1,
                                    ),
                                    dropMenuItems: cubit.modes,
                                    selectedValue: cubit.selectedMode ?? "",
                                    hintText: cubit.modes[0],
                                    onChange: (value) {
                                      cubit.changeCalendarMode(value!, context);
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
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
                              controller: dateRangePickerController,
                              selectionShape:
                                  DateRangePickerSelectionShape.rectangle,
                              selectionColor: myFavColor,
                              backgroundColor: calendarBg.withOpacity(0.5),
                              startRangeSelectionColor: myFavColor,
                              selectionMode: cubit.mode,
                              selectionRadius: 0,
                              headerStyle: DateRangePickerHeaderStyle(
                                textAlign: TextAlign.center,
                                backgroundColor: myFavColor,
                                textStyle: Theme.of(context).textTheme.button,
                              ),
                              rangeTextStyle:
                                  Theme.of(context).textTheme.bodyText1,
                              enablePastDates: false,
                              initialDisplayDate: DateTime.now(),
                              monthViewSettings:
                                  const DateRangePickerMonthViewSettings(
                                firstDayOfWeek: 6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "تنبيه",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: myFavColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: Card(
                                margin: EdgeInsets.zero,
                                color: Theme.of(context).cardColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide.none,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.notifications,
                                          color: myFavColor1),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: cubit.timeController,
                                          enabled: false,
                                          validator: (String? time) {
                                            if (time!.isEmpty) {
                                              return "برجاء اضافة وقت للتنبيه";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            hintText: "أضف وقت للتنبيه",
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                cubit.changeTimeState(
                                    newTime: value!.format(context).toString());
                                cubit.formKey.currentState!.save();
                              });
                            },
                            child: SizedBox(
                              height: 44,
                              width: 44,
                              child: Card(
                                margin: EdgeInsets.zero,
                                color: lightRose,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide.none,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: myFavColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      myMaterialButton(
                        context: context,
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            debugPrint(cubit.treatmentNameController.text);
                            debugPrint(cubit.selectedQuantity);
                            //debugPrint("selectedDates ${dateRangePickerController.selectedDates.toString()}");
                            cubit.selectedDate = dateRangePickerController.selectedDates.toString();
                            debugPrint(cubit.selectedDate);
                            //debugPrint("startDate ${dateRangePickerController.selectedRange?.startDate.toString() ?? ""}");
                            cubit.startDate = dateRangePickerController.selectedRange?.startDate.toString() ?? "";
                            debugPrint(cubit.startDate);
                            //debugPrint("endDate ${dateRangePickerController.selectedRange?.endDate.toString() ?? ""}");
                            cubit.secondDate = dateRangePickerController.selectedRange?.endDate.toString() ??"";
                            debugPrint(cubit.secondDate);
                            debugPrint(cubit.timeController.text);
                          }
                        },
                        labelWidget: Text(
                          "تم",
                          style: Theme.of(context).textTheme.button,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}