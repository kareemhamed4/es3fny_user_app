import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/layout/layout_screen.dart';
import 'package:es3fny_user_app/responsive.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TrackingInfoScreen extends StatefulWidget {
  const TrackingInfoScreen({Key? key}) : super(key: key);

  @override
  State<TrackingInfoScreen> createState() => _TrackingInfoScreenState();
}

class _TrackingInfoScreenState extends State<TrackingInfoScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  TextEditingController hospitalController = TextEditingController();

  String label = "تأكيد";
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((_) {
      if (Responsive.isMobile(context)) {
        showMyBottomSheet(context: context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "track_info_title".tr(context),
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
        ),
      ),
      body: Responsive(
        mobile: buildMobileTrackingDetailsScreen(context),
        desktop: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: double.infinity,
                      height: size.height - 80,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      child: const Image(
                        image: AssetImage("assets/images/Map.png"),
                        fit: BoxFit.fitWidth,
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'track_ambulance'.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 18,
                                ),
                          ),
                          Text(
                            'ambulance_time_remaining'.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  color: myFavColor,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/308888645_3298435880403234_8809857619090350383_n.jpeg'),
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'محمد عبد الغني',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    'driver'.tr(context),
                                    style:
                                        Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FluentIcons.call_16_regular,
                                color: myFavColor,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: myFavColor.withOpacity(0.1),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: myFavColor,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "track_address".tr(context),
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "2972 Westheimer Rd. Santa Ana",
                                style: Theme.of(context).textTheme.caption,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: myFavColor.withOpacity(0.1),
                            child: Icon(
                              Icons.add_home_outlined,
                              color: myFavColor,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 16),
                                  child: TextFormField(
                                    controller: hospitalController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        displayErrorMotionToast(
                                          context: context,
                                          title: langCode == "en"
                                              ? "Error"
                                              : "خطأ",
                                          description: langCode == "en"
                                              ? "Please enter hospital name"
                                              : "برجاء ادخال اسم المستشفي للتأكيد",
                                        );
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          myFavColor1.withOpacity(0.1),
                                      contentPadding: const EdgeInsets.only(
                                          right: 5, left: 5),
                                      label: Text(
                                        "track_destination".tr(context),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(fontSize: 10),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: MaterialButton(
                                  height: 32,
                                  color: myFavColor,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      hospitalController.text =
                                          hospitalController.text;
                                    }
                                  },
                                  child: Text(
                                    "track_confirm".tr(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(fontSize: 12),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        child: Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            height: 32,
                            color: myFavColor,
                            onPressed: () {
                              showMyDialog(
                                context: context,
                                icon: Icons.info_outline,
                                titleWidget: Text(
                                  "track_alert".tr(context),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 18),
                                ),
                                contentWidget: Text(
                                  "track_alert_content".tr(context),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 18),
                                ),
                                onConfirm: () {
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                  NavigateToReb(
                                      context: context,
                                      widget: const LayoutScreen());
                                  displayWarningMotionToast(
                                    context: context,
                                    title: langCode == "en"
                                        ? "Warning"
                                        : "تحذير",
                                    description: langCode == "en"
                                        ? "Your request is being processed"
                                        : "طلبك قيد التنفيذ",
                                  );
                                },
                              );
                            },
                            child: Text(
                              "track_cancel_request".tr(context),
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
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

  Stack buildMobileTrackingDetailsScreen(BuildContext context) {
    return Stack(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'track_ambulance'.tr(context),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 22,
                                  ),
                        ),
                        Text(
                          'ambulance_time_remaining'.tr(context),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: myFavColor,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/308888645_3298435880403234_8809857619090350383_n.jpeg'),
                              radius: 30,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'محمد عبد الغني',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 16),
                                ),
                                Text(
                                  'driver'.tr(context),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FluentIcons.call_16_regular,
                              color: myFavColor,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    myDivider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: myFavColor.withOpacity(0.1),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: myFavColor,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "track_address".tr(context),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: myFavColor.withOpacity(0.1),
                          child: Icon(
                            Icons.add_home_outlined,
                            color: myFavColor,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 16),
                                child: TextFormField(
                                  controller: hospitalController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      displayErrorMotionToast(
                                        context: context,
                                        title:
                                            langCode == "en" ? "Error" : "خطأ",
                                        description: langCode == "en"
                                            ? "Please enter hospital name"
                                            : "برجاء ادخال اسم المستشفي للتأكيد",
                                      );
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: myFavColor1.withOpacity(0.1),
                                    contentPadding: const EdgeInsets.only(
                                        right: 5, left: 5),
                                    label: Text(
                                      "track_destination".tr(context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(fontSize: 12),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: MaterialButton(
                                height: 32,
                                color: myFavColor,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    hospitalController.text =
                                        hospitalController.text;
                                  }
                                },
                                child: Text(
                                  "track_confirm".tr(context),
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          height: 32,
                          color: myFavColor,
                          onPressed: () {
                            showMyDialog(
                              context: context,
                              icon: Icons.info_outline,
                              titleWidget: Text(
                                "track_alert".tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 18),
                              ),
                              contentWidget: Text(
                                "track_alert_content".tr(context),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 18),
                              ),
                              onConfirm: () {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                NavigateToReb(
                                    context: context,
                                    widget: const LayoutScreen());
                                displayWarningMotionToast(
                                  context: context,
                                  title: langCode == "en" ? "Warning" : "تحذير",
                                  description: langCode == "en"
                                      ? "Your request is being processed"
                                      : "طلبك قيد التنفيذ",
                                );
                              },
                            );
                          },
                          child: Text(
                            "track_cancel_request".tr(context),
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
