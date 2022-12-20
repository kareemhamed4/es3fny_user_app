import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: myFavColor,
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SizedBox(
                height: 370,
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Column(
                    children: [
                      Container(
                        height: 260,
                        width: double.infinity,
                        color: myFavColor,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        child: Container(
                          height: 110,
                          width: double.infinity,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/308888645_3298435880403234_8809857619090350383_n.jpeg',
                    ),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 152,
                      width: 279,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: myFavColor4.withOpacity(0.2),
                            blurStyle: BlurStyle.outer,
                            offset: const Offset(0, 2),
                            spreadRadius: 1,
                          )
                        ],
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Center(
                                  child: Text(
                                "محمد عبد الغني",
                                style: Theme.of(context).textTheme.bodyText2,
                              ))),
                          Divider(
                            color: myFavColor11,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      pageController.previousPage(
                                          duration: const Duration(milliseconds: 750),
                                          curve: Curves.fastLinearToSlowEaseIn
                                      );
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            "المعلومات الشخصية",
                                            style:
                                                Theme.of(context).textTheme.bodyText2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: myFavColor11,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      pageController.nextPage(
                                          duration: const Duration(milliseconds: 750),
                                          curve: Curves.fastLinearToSlowEaseIn
                                      );
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          "العائلة",
                                          style:
                                              Theme.of(context).textTheme.bodyText2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 2,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 5,
                      activeDotColor: myFavColor,
                      dotColor: Colors.grey,
                      dotHeight: 5,
                      dotWidth: 5,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: pageController,
                      itemBuilder: (context, index) => Container(),
                      itemCount: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0,h);
    path.quadraticBezierTo(
      w*0.08,
      h-100,
      w*0.2,
      h-100,
    );
    path.quadraticBezierTo(
      w*0.8,
      h-100,
      w,
      h,
    );
    path.lineTo(w,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}*/
/*
Scaffold(
      backgroundColor: myFavColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.2672),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AppBar(
              backgroundColor: myFavColor,
              leading: IconButton(
                  onPressed: () {
                    NavigateTo(context: context, widget: const SettingsScreen());
                  },
                  icon: const Icon(Icons.settings,color: Colors.white,)),
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.notifications_none_outlined,color: Colors.white,),
                ),
              ],
            ),
            Container(
              height: 152,
              width: 279,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                ),
                Container(
                  height: 152,
                  width: 279,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
 */
/*
Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: size.height * 0.5,
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: size.height * 0.39,
                width: double.infinity,
                color: myFavColor,
              ),
            ),
          ),
          Container(
            height: 152,
            width: 279,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: myFavColor4.withOpacity(0.2),
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0,2),
                  spreadRadius: 1,
                )
              ],
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
*/
