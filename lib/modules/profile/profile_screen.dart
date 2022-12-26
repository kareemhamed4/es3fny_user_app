import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/modules/setting/settings_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/foundation.dart';
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
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var formKey = GlobalKey<FormState>();
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
    TextEditingController familyNameController = TextEditingController();
    TextEditingController familyPhoneController = TextEditingController();
    TextEditingController familyNicknameController = TextEditingController();


    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        ProfileCubit cubit = BlocProvider.of(context);
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: myFavColor,
          body: SafeArea(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            SizedBox(
                              height: 340,
                              child: Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 245,
                                      width: double.infinity,
                                      color: myFavColor,
                                    ),
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40),
                                      ),
                                      child: Container(
                                        height: 95,
                                        width: double.infinity,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 140, start: 16),
                              child: Text(
                                "الحساب\n   الشخصي",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  NavigateTo(
                                    context: context,
                                    widget: const SettingsScreen(),
                                  );
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: myFavColor12,
                                )),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_none_outlined,
                                  color: myFavColor12,
                                )),
                          ],
                        )
                      ],
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
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "محمد عبد الغني",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      if (cubit.currentPageIndex == 0)
                                        IconButton(
                                          onPressed: () {
                                            cubit.changeEditingState();
                                          },
                                          icon: Icon(
                                            cubit.editIcon,
                                            color: myFavColor11,
                                            size: 24,
                                          ),
                                        ),
                                    ],
                                  )),
                                ),
                                Divider(
                                  color: myFavColor11,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          height: 6,
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
                          height: 6,
                        ),
                        Expanded(
                          child: PageView(
                            physics: cubit.scrollPhysics,
                            controller: pageController,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    buildPersonalInfoItem(
                                      context: context,
                                      size: size,
                                      label: "الإسم",
                                      widget: TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          enabled: cubit.isEnabled,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    buildPersonalInfoItem(
                                      context: context,
                                      size: size,
                                      label: "الرقم القومي",
                                      widget: TextFormField(
                                        controller: nIDController,
                                        decoration: InputDecoration(
                                          enabled: cubit.isEnabled,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    buildPersonalInfoItem(
                                      context: context,
                                      size: size,
                                      label: "رقم الهاتف",
                                      widget: TextFormField(
                                        controller: phoneController,
                                        decoration: InputDecoration(
                                          enabled: cubit.isEnabled,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    buildPersonalInfoItem(
                                      context: context,
                                      size: size,
                                      label: "البريد الإلكتروني",
                                      widget: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          enabled: cubit.isEnabled,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    buildPersonalInfoItem(
                                      context: context,
                                      size: size,
                                      label: "العمر",
                                      widget: TextFormField(
                                        controller: ageController,
                                        decoration: InputDecoration(
                                          enabled: cubit.isEnabled,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            buildFamilyPageViewScreen(
                                                context: context,
                                                size: size,
                                                model: cubit.family[index],
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              height: 12,
                                            ),
                                        itemCount: cubit.family.length),
                                  ),
                                ],
                              ),
                            ],
                            onPageChanged: (index) {
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
          ),
          floatingActionButton: cubit.currentPageIndex == 1
              ? FloatingActionButton(
                  onPressed: () {
                    if (cubit.isBottomSheetShown) {
                      if(formKey.currentState!.validate()){
                        cubit.insertToDatabase(
                            name: familyNameController.text,
                            phone: familyPhoneController.text,
                            nickname: familyNicknameController.text
                        );
                        cubit.getFamilyDataFromDatabase(cubit.database).then((value) {
                          cubit.family = value;
                          if (kDebugMode) {
                            print(cubit.family);
                          }
                          Navigator.pop(context);
                        });
                      }
                    } else {
                      cubit.changeFabIcon();
                      cubit.changeScrollPhysics();
                      scaffoldKey.currentState!.showBottomSheet((context) {
                        return Container(
                          color: myFavColor.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  myTextFormField(
                                      context: context,
                                      controller: familyNameController,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "برجاء ادخال الإسم";
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(Icons.title),
                                      hint: "الإسم"),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  myTextFormField(
                                    context: context,
                                    controller: familyPhoneController,
                                    prefixIcon:
                                        const Icon(Icons.dialpad_outlined),
                                    hint: "رقم الهاتف",
                                    validate: (value) {
                                      if (value!.length < 11) {
                                        return "برجاء ادخال رقم هاتف صحيح";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  myTextFormField(
                                      context: context,
                                      controller: familyNicknameController,
                                      prefixIcon: const Icon(
                                          Icons.label_important_outline),
                                      hint: "الكنية"),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).closed.then((value){
                        cubit.changeFabIcon();
                        cubit.changeScrollPhysics();
                      });
                    }
                  },
                  backgroundColor: myFavColor,
                  child: Icon(
                    cubit.fabIcon,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
  Widget buildPersonalInfoItem({
    required BuildContext context,
    required Size size,
    required String label,
    required Widget widget,
  }) =>
      Padding(
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
                        label,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    widget,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildFamilyPageViewScreen({
    required BuildContext context,
    required Size size,
    required Map model,
  }) =>
      Dismissible(
        background: Container(
          color: myFavColor,
          child: const  Padding(
            padding: EdgeInsetsDirectional.only(start: 16),
            child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Icon(Icons.delete_outline,color: Colors.white,)),
          ),
        ),
        secondaryBackground: Container(
          color: myFavColor,
          child: const Padding(
            padding: EdgeInsetsDirectional.only(end: 16),
            child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(Icons.delete_outline,color: Colors.white,)),
          ),
        ),
        key: UniqueKey(),
        onDismissed: (direction){
          ProfileCubit.get(context).deleteData(id: model["id"]);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: myFavColor.withOpacity(0.5),
            onTap: () {},
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        "${model["name"]}",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "${model["nickname"]}",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  subtitle: Text("${model["phone"]}"),
                  leading: Icon(
                    Icons.person_outline_sharp,
                    color: myFavColor11,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
      );
}
