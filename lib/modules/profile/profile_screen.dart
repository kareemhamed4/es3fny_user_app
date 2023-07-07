import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/settings/setting_screen.dart';
import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "profileScaffoldKey");
  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: "profileFormKey");
  GlobalKey<FormState> formFamilyKey = GlobalKey<FormState>(debugLabel: "familyFormKey");
  var formAlertKey = GlobalKey<FormState>();
  PageController pageController = PageController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nIDController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController familyPhoneController = TextEditingController();
  TextEditingController familyNicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ProfileCubit.get(context).userModel;
        nameController.text = (model != null && model.data != null) ? model.data!.name! : " ";
        nIDController.text = (model != null && model.data != null) ? model.data!.nationalId! : " ";
        phoneController.text = (model != null && model.data != null) ? "0${model.data!.phoneNumber!}" : " ";
        emailController.text = (model != null && model.data != null) ? model.data!.email! : " ";
        ProfileCubit.get(context).selectedValue = (model != null && model.data != null)
            ? model.data!.gender! == 1
                ? "male".tr(context)
                : "female".tr(context)
            : " ";
        ageController.text = (model != null && model.data != null) ? model.data!.age!.toString() : " ";
        Size size = MediaQuery.of(context).size;
        ProfileCubit cubit = BlocProvider.of(context);
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: myFavColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: myFavColor,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
          ),
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
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(bottom: 140, start: 16),
                              child: Text(
                                "personal_profile".tr(context),
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                  color: myFavColor6,
                                )),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                debugPrint(token);
                              },
                              icon: Icon(
                                Icons.notifications_none_outlined,
                                color: myFavColor6,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage((cubit.userModel != null && cubit.userModel!.data != null)
                              ? model!.data!.profileImage!
                              : "https://img.freepik.com/free-icon/user_318-159712.jpg"),
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
                                  color: myFavColor3.withOpacity(0.2),
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
                                          cubit.userModel != null ? nameController.text : " ",
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                        if (cubit.currentPageIndex == 0)
                                          IconButton(
                                            onPressed: () {
                                              cubit.changeEditingState();
                                              !cubit.isEditing ? cubit.updateUserInfo(
                                                email: emailController.text,
                                                name: nameController.text,
                                                nationalId: nIDController.text,
                                                phone: phoneController.text.substring(1,11),
                                                gender: cubit.selectedValue == 'male'.tr(context) ? 1 : 0,
                                                age: int.parse(ageController.text),
                                              ) : null;
                                            },
                                            icon: Icon(
                                              cubit.editIcon,
                                              color: myFavColor5,
                                              size: 24,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: myFavColor5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              cubit.isEnabledGesture
                                                  ? {
                                                      cubit.changePageIndex(0),
                                                      pageController.previousPage(
                                                        duration: const Duration(
                                                          milliseconds: 750,
                                                        ),
                                                        curve: Curves.fastLinearToSlowEaseIn,
                                                      )
                                                    }
                                                  : null;
                                            },
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      "personal_info".tr(context),
                                                      style: cubit.currentPageIndex == 0
                                                          ? Theme.of(context).textTheme.bodyText1
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .bodyText1!
                                                              .copyWith(color: myFavColor5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: myFavColor5,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              cubit.changePageIndex(1);
                                              pageController.nextPage(
                                                  duration: const Duration(milliseconds: 750),
                                                  curve: Curves.fastLinearToSlowEaseIn);
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Text(
                                                  "family".tr(context),
                                                  style: cubit.currentPageIndex == 1
                                                      ? Theme.of(context).textTheme.bodyText1
                                                      : Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: myFavColor5,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                              ConditionalBuilder(
                                condition: (cubit.userModel != null),
                                builder: (context) => SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      buildPersonalInfoItem(
                                        context: context,
                                        size: size,
                                        label: "user_name".tr(context),
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
                                        label: "user_nID".tr(context),
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
                                        label: "user_phone".tr(context),
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
                                        label: "user_email".tr(context),
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
                                        label: "user_age".tr(context),
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
                                      buildPersonalInfoItem(
                                        context: context,
                                        size: size,
                                        label: "user_gender".tr(context),
                                        widget: DropdownButtonFormField2(
                                          decoration: InputDecoration(
                                            enabled: cubit.isEnabled,
                                            //Add isDense true and zero Padding.
                                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                            isDense: true,
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                            //Add more decoration as you want here
                                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                          ),
                                          isExpanded: true,
                                          hint: Text(
                                            model != null && model.data != null ? model.data!.gender == 1 ? "male".tr(context) : "female".tr(context) : "",
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: myFavColor5,
                                                fontSize: 16,
                                                fontFamily: "FinalR"),
                                          ),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                          ),
                                          iconSize: 30,
                                          buttonHeight: 48,
                                          dropdownDecoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Theme.of(context).cardColor,
                                          ),
                                          items: cubit.isEnabled ? cubit.genderItems
                                              .map((item) => DropdownMenuItem<String>(
                                            value: item.tr(context),
                                            onTap: () {
                                              setState(
                                                    () => () {
                                                  cubit.selectedValue = item.tr(context);
                                                },
                                              );
                                            },
                                            child: Text(
                                              item.tr(context),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                  fontSize: 18, fontFamily: "FinalR"),
                                            ),
                                          ))
                                              .toList() : [],
                                          validator: (value) {
                                            if (value == null) {
                                              return "register_gender_choose".tr(context);
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            //Do something when changing the item if you want.
                                          },
                                          onSaved: (value) {
                                            cubit.selectedValue = value.toString();
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                                fallback: (context) => const Center(child: CircularProgressIndicator()),
                              ),
                              ConditionalBuilder(
                                condition: (cubit.familyMembers != null && cubit.familyMembers!.data != null && cubit.familyMembers!.data!.isNotEmpty),
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) => Slidable(
                                          endActionPane: ActionPane(
                                            motion: const StretchMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: ((context) {
                                                  cubit.deleteFamilyMember(
                                                    memberId: cubit.familyMembers!.data![index].id!,
                                                  );
                                                }),
                                                backgroundColor: myFavColor,
                                                icon: Icons.delete_outline,
                                              ),
                                            ],
                                          ),
                                          startActionPane: ActionPane(
                                            motion: const StretchMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: ((slidableContext) {
                                                  familyNameController.text = cubit.familyMembers!.data![index].name!;
                                                  familyPhoneController.text =
                                                      "0${cubit.familyMembers!.data![index].phoneNumber!}";
                                                  familyNicknameController.text =
                                                      cubit.familyMembers!.data![index].kinship ?? "";
                                                  showMyDialog(
                                                    context: context,
                                                    formKey: formAlertKey,
                                                    onConfirm: () {
                                                      if (formAlertKey.currentState!.validate()) {
                                                        // update
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    titleWidget: Text(
                                                      "edit_dialog_title".tr(context),
                                                      style:
                                                          Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                                                    ),
                                                    contentWidget: Column(
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
                                                          prefixIcon: const Icon(Icons.dialpad_outlined),
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
                                                            prefixIcon: const Icon(Icons.label_important_outline),
                                                            hint: "الكنية"),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                                backgroundColor: myFavColor5,
                                                icon: Icons.edit_outlined,
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                            highlightColor: myFavColor.withOpacity(0.5),
                                            onTap: () {},
                                            child: Container(
                                              color: Theme.of(context).cardColor,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                ),
                                                child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                        cubit.familyMembers!.data![index].name!,
                                                        style: Theme.of(context).textTheme.bodyText1,
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        cubit.familyMembers!.data![index].kinship ?? "",
                                                        style:
                                                            Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  subtitle: Text(
                                                    "0${cubit.familyMembers!.data![index].phoneNumber!}",
                                                  ),
                                                  leading: Icon(
                                                    Icons.person_outline_sharp,
                                                    color: myFavColor5,
                                                  ),
                                                  contentPadding: EdgeInsets.zero,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        separatorBuilder: (context, index) => const SizedBox(
                                          height: 12,
                                        ),
                                        itemCount: cubit.familyMembers!.data!.length,
                                      ),
                                    ),
                                  ],
                                ),
                                fallback: (context) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "لا توجد أفراد، أضف الآن",
                                      style: Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                ),
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
                      if (formKey.currentState!.validate()) {
                        // insert & get
                        cubit.addFamilyMember(
                          name: familyNameController.text,
                          phone: familyPhoneController.text.substring(1, 11),
                          kinship: familyNicknameController.text,
                        );
                        Navigator.pop(context);
                      }
                    } else {
                      cubit.changeFabIcon();
                      cubit.changeScrollPhysics();
                      cubit.changeIsEnabledGestureState(isEnabled: false);
                      familyNameController.clear();
                      familyPhoneController.clear();
                      familyNicknameController.clear();
                      scaffoldKey.currentState!
                          .showBottomSheet((context) {
                            return Padding(
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
                                          return "add_family_name_validate".tr(context);
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(Icons.title),
                                      hint: "add_family_name".tr(context),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    myTextFormField(
                                      context: context,
                                      controller: familyPhoneController,
                                      prefixIcon: const Icon(Icons.dialpad_outlined),
                                      hint: "add_family_phone".tr(context),
                                      validate: (value) {
                                        if (value!.length < 11) {
                                          return "add_family_phone_validate".tr(context);
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
                                      prefixIcon: const Icon(Icons.label_important_outline),
                                      hint: "add_family_kinship".tr(context),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                          .closed
                          .then((value) {
                            cubit.changeIsEnabledGestureState(isEnabled: true);
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
                side: BorderSide.none,
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
                        style: Theme.of(context).textTheme.bodyText1,
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
}
