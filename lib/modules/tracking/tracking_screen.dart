import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/tracking_info/tracking_info_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/responsive.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/components/my_google_map.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: buildMobileTrackingScreen(context),
        desktop: buildMobileTrackingScreen(context),
        tablet: buildMobileTrackingScreen(context),
      ),
    );
  }

  CustomScrollView buildMobileTrackingScreen(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Center(
                child: Text(
                  "history".tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
          expandedHeight: 370,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                if (currentLatitude != null) const MyGoogleMap(isGoToMyLocationEnabled: false,isTracking: false,),
                if (currentLatitude == null)
                  Center(
                      child: Text(
                    "Loading",
                    style: Theme.of(context).textTheme.caption,
                  )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 60),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            NavigateTo(
                                context: context,
                                widget: const TrackingInfoScreen());
                          },
                          color: myFavColor,
                          height: 68,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "tap_for_tracking".tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(fontSize: 18),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          color: myFavColor,
                          height: 68,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "tracking_address".tr(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(fontSize: 16),
                                  ),
                                  Text("time_remaining".tr(context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(fontSize: 14)),
                                ],
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildHistoryItem(context: context),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: 8,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHistoryItem({required BuildContext context}) => Container(
        height: 94,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
      );
}
