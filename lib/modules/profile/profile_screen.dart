import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PersonalModel {
  final String label;
  final Widget widget;

  PersonalModel({
    required this.label,
    required this.widget,
  });
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    TextEditingController nameController = TextEditingController();
    TextEditingController nIDController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    nameController.text = "محمد أحمد عبد الغني دومه";
    nIDController.text = "30004011601693";
    phoneController.text = "01157567842";
    emailController.text = "mohamed.abdelghany@gmail.com";
    ageController.text = "22";
    List<PersonalModel> personalInfo = [
      PersonalModel(
          label: "الإسم",
          widget: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              enabled: false,
              contentPadding: EdgeInsets.zero,
            ),
          )
      ),
      PersonalModel(
          label: "الرقم القومي",
          widget: TextFormField(
            controller: nIDController,
            decoration: const InputDecoration(
              enabled: false,
              contentPadding: EdgeInsets.zero,
            ),
          )
      ),
      PersonalModel(
          label: "رقم الهاتف",
          widget: TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              enabled: false,
              contentPadding: EdgeInsets.zero,
            ),
          )
      ),
      PersonalModel(
          label: "البريد الإلكتروني",
          widget: TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              enabled: false,
              contentPadding: EdgeInsets.zero,
            ),
          )
      ),
      PersonalModel(
          label: "العمر",
          widget: TextFormField(
            controller: ageController,
            decoration: const InputDecoration(
              enabled: false,
              contentPadding: EdgeInsets.zero,
            ),
          )
      ),
    ];
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        ProfileCubit cubit = BlocProvider.of(context);
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
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ))),
                              Divider(
                                color: myFavColor11,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            cubit.changePageIndex(0);
                                            pageController.previousPage(
                                                duration: const Duration(
                                                    milliseconds: 750),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn);
                                          },
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Center(
                                                child: FittedBox(
                                                  child: Text(
                                                    "المعلومات الشخصية",
                                                    style: cubit.currentPageIndex ==
                                                            0
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .bodyText2
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                                color:
                                                                    myFavColor11),
                                                  ),
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
                                          onTap: () {
                                            cubit.changePageIndex(1);
                                            pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 750),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn);
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                "العائلة",
                                                style: cubit.currentPageIndex ==
                                                        1
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                            color:
                                                                myFavColor11),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                      const SizedBox(
                        height: 10,
                      ),
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
                      const SizedBox(
                        height: 4,
                      ),
                      Expanded(
                        child: PageView(
                          physics: const BouncingScrollPhysics(),
                          controller: pageController,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (context,index) => buildPageViewScreen(context: context, size: size,model: personalInfo[index]),
                                      separatorBuilder: (context,index) => const SizedBox(height: 12,),
                                      itemCount: personalInfo.length
                                  ),
                                ),
                              ],
                            ),
                            Column(),
                          ],
                          onPageChanged: (index){
                            cubit.changePageIndex(index);
                          },
                        ),
                      ),
                    ],
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
 Widget buildPageViewScreen({
  required BuildContext context,
  required Size size,
  required PersonalModel model,
}) => Padding(
   padding: const EdgeInsets.symmetric(horizontal: 16),
   child: InkWell(
     borderRadius: BorderRadius.circular(20),
     highlightColor: myFavColor.withOpacity(0.5),
     onTap: () {},
     child: SizedBox(
       height: size.height * 0.14,
       child: Card(
         clipBehavior: Clip.antiAliasWithSaveLayer,
         color: Theme.of(context).cardColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
         ),
         elevation: 5,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Align(
                 alignment: AlignmentDirectional.centerStart,
                 child: Text(
                   model.label,
                   style: Theme.of(context).textTheme.bodyText2,
                 ),
               ),
               const SizedBox(height: 8,),
               model.widget,
             ],
           ),
         ),
       ),
     ),
   ),
 );

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
