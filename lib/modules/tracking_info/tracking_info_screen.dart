import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/layout/layout_screen.dart';
import 'package:es3fny_user_app/main_button/cubit/cubit.dart';
import 'package:es3fny_user_app/main_button/cubit/states.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/components/my_google_map.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  double sheetHeight = 100.0;
  bool isSheetExpanded = false;
  void onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      sheetHeight -= details.primaryDelta!;
      if (sheetHeight < 100) {
        sheetHeight = 100;
        isSheetExpanded = false;
      } else if (sheetHeight > 375) {
        sheetHeight = 375;
        isSheetExpanded = true;
      }
    });
  }

  @override
  void initState() {
    currentLocationAsString = CacheHelper.getData(key: "currentLocation");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendRequestCubit, SendRequestStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SendRequestCubit cubit = BlocProvider.of(context);
        var model = cubit.paramedicModel;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            title: GestureDetector(
              onTap: () {},
              child: Text(
                "track_info_title".tr(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
            ),
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          body: currentLocation == null
              ? Center(
                  child: Text(
                    "Loading",
                    style: Theme.of(context).textTheme.caption,
                  ),
                )
              : Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.expand,
                  children: [
                    const MyGoogleMap(isGoToMyLocationEnabled: true,isTracking: true,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onVerticalDragUpdate: onVerticalDragUpdate,
                        onVerticalDragEnd: (_) {
                          setState(() {
                            if (sheetHeight > 130) {
                              sheetHeight = 375;
                              isSheetExpanded = true;
                            } else {
                              sheetHeight = 100;
                              isSheetExpanded = false;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          height: sheetHeight,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Container(
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'track_ambulance'.tr(context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 22,
                                          ),
                                    ),
                                    if (model != null &&
                                        model.plamerData != null)
                                      Text(
                                        'ambulance_time_remaining'.tr(context),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              color: myFavColor,
                                            ),
                                      ),
                                    if (model == null)
                                      Text(
                                        'ليس لديك أي طلب للإسعاف لتتبعه',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: myFavColor,
                                            ),
                                      ),
                                    if (model != null &&
                                        model.plamerData == null)
                                      Text(
                                        'جارٍ تحديد هاويه المسعف',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              color: myFavColor,
                                            ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                if (state is GetParamedicSuccessState)
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Form(
                                          key: formKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                          "https://img.freepik.com/free-icon/user_318-159712.jpg",
                                                        ),
                                                        radius: 30,
                                                      ),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            model!.plamerData!
                                                                .name!,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                          const SizedBox(
                                                            height: 6,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'driver'.tr(
                                                                    context),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .caption,
                                                              ),
                                                              const SizedBox(
                                                                width: 6,
                                                              ),
                                                              Text(
                                                                "ب${model.plamerData!.unit!}",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText2!
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        FluentIcons
                                                            .call_16_regular,
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
                                                    backgroundColor: myFavColor
                                                        .withOpacity(0.1),
                                                    child: Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: myFavColor,
                                                      size: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "track_address"
                                                            .tr(context),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption,
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        model.plamerData!
                                                            .address!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption,
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
                                                    backgroundColor: myFavColor
                                                        .withOpacity(0.1),
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
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .only(
                                                                  end: 16),
                                                          child: TextFormField(
                                                            controller:
                                                                hospitalController,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                displayErrorMotionToast(
                                                                  context:
                                                                      context,
                                                                  title: langCode ==
                                                                          "en"
                                                                      ? "Error"
                                                                      : "خطأ",
                                                                  description: langCode ==
                                                                          "en"
                                                                      ? "Please enter hospital name"
                                                                      : "برجاء ادخال اسم المستشفي للتأكيد",
                                                                );
                                                              }
                                                              return null;
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor:
                                                                  myFavColor1
                                                                      .withOpacity(
                                                                          0.1),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 5,
                                                                      left: 5),
                                                              label: Text(
                                                                "track_destination"
                                                                    .tr(context),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .caption!
                                                                    .copyWith(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
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
                                                            if (formKey
                                                                .currentState!
                                                                .validate()) {
                                                              hospitalController
                                                                      .text =
                                                                  hospitalController
                                                                      .text;
                                                            }
                                                          },
                                                          child: Text(
                                                            "track_confirm"
                                                                .tr(context),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .button,
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
                                                        icon:
                                                            Icons.info_outline,
                                                        titleWidget: Text(
                                                          "track_alert"
                                                              .tr(context),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          18),
                                                        ),
                                                        contentWidget: Text(
                                                          "track_alert_content"
                                                              .tr(context),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .caption!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          18),
                                                        ),
                                                        onConfirm: () {
                                                          Navigator.of(context)
                                                              .popUntil((route) =>
                                                                  route
                                                                      .isFirst);
                                                          NavigateToReb(
                                                              context: context,
                                                              widget:
                                                                  const LayoutScreen());
                                                          displayWarningMotionToast(
                                                            context: context,
                                                            title:
                                                                langCode == "en"
                                                                    ? "Warning"
                                                                    : "تحذير",
                                                            description: langCode ==
                                                                    "en"
                                                                ? "Your request is being processed"
                                                                : "طلبك قيد التنفيذ",
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      "track_cancel_request"
                                                          .tr(context),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .button,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (model != null && model.status == null)
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (isSheetExpanded &&
                                            sheetHeight > 150)
                                          const CircularProgressIndicator(),
                                      ],
                                    ),
                                  ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
