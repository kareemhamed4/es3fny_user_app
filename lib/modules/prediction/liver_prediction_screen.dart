import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiverPredictionScreen extends StatelessWidget {
  LiverPredictionScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController totalBilirubinController = TextEditingController();
  final TextEditingController directBilirubinController = TextEditingController();
  final TextEditingController alkalinePhosphotaseController = TextEditingController();
  final TextEditingController alamineAminotransferaseController = TextEditingController();
  final TextEditingController aspartateAminotransferaseController = TextEditingController();
  final TextEditingController totalProtiensController = TextEditingController();
  final TextEditingController albuminController = TextEditingController();
  final TextEditingController albuminAndGlobulinRatioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit,PredictionStates>(
        listener: (context,state){
          if (state is LiverPredictionSuccessState) {
            if(state.liverModel.predictionResult == 0){
              showMyDialog(
                context: context,
                titleWidget: Text(
                  "لا يوجد احتمال لإصابتك بالمرض",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                confirmText: "حسناً",
                isCancelButton: false,
                onConfirm: () {
                  Navigator.pop(context);
                },
              );
            }else{
              showMyDialog(
                context: context,
                titleWidget: Text(
                  "احتمال اصابتك بالمرض كبير",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                contentWidget: Text(
                  "الرجاء التوجة الي طبيب متخصص في اقرب وقت",
                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
                ),
                confirmText: "حسناً",
                isCancelButton: false,
                onConfirm: () {
                  Navigator.pop(context);
                },
              );
            }
          }
        },
        builder: (context,state){
          Size size = MediaQuery.of(context).size;
          PredictionCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "التنبؤ بمرض الكبد",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
              ),
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "ساعدنا ببعض الاسئلة",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 24, color: myFavColor),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "معلومات شخصية",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 21),
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      Text(
                        'العمر',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: ageController,
                        context: context,
                        hint: "الرجاء ادخال رقم",
                        maxLength2: 2,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'register_gender'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myDropDownButton(
                        context: context,
                        isRegisterForm: true,
                        dropMenuItems: cubit.genderItems,
                        selectedValue: cubit.selectedGender,
                        hintText: "register_gender_choose",
                        onChange: (value) {
                          cubit.selectedGender = value.toString();
                        },
                        validateText: "required",
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Total Bilirubin'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: totalBilirubinController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Direct Bilirubin'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: directBilirubinController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Alkaline Phosphotase'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: alkalinePhosphotaseController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Alamine Aminotransferase'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: alamineAminotransferaseController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Aspartate Aminotransferase'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: aspartateAminotransferaseController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Total Protiens'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: totalProtiensController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Albumin'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: albuminController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'Albumin and Globulin Ratio'.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: albuminAndGlobulinRatioController,
                        context: context,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      ConditionalBuilder(
                        condition: state is! LiverPredictionLoadingState,
                        builder: (context) =>  myMaterialButton(
                          context: context,
                          labelWidget: Text(
                            "تنبأ",
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: (){
                            if(formKey.currentState!.validate()){

                            }
                          },
                        ),
                        fallback: (context) => myMaterialButton(
                          context: context,
                          onPressed: () {
                            null;
                          },
                          labelWidget: const Center(
                            child: SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
