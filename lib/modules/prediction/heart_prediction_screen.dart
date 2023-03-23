import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartPredictionScreen extends StatelessWidget {
  HeartPredictionScreen({Key? key}) : super(key: key);
  final TextEditingController ageController = TextEditingController();
  final TextEditingController pressureController = TextEditingController();
  final TextEditingController cholestoralController = TextEditingController();
  final TextEditingController maximumHeartRateController = TextEditingController();
  final TextEditingController depressionController = TextEditingController();
  final TextEditingController numberVesselsController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit, PredictionStates>(
        listener: (context, state) {},
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          PredictionCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "التنبؤ بمرض القلب",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 22),
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
                        "Chest Pain Type".tr(context),
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
                        validateText: "required",
                        dropMenuItems: cubit.chestPainItems,
                        selectedValue: cubit.selectedChestPain,
                        hintText: "Chest Pain Type",
                        onChange: (value) {
                          cubit.selectedChestPain = value.toString();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'ضغط الدم أثناء الراحة (ملم زئبق)',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        context: context,
                        controller: pressureController,
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
                        'مصل الكوليسترول (ملغم / ديسيلتر)',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        context: context,
                        controller: cholestoralController,
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
                        'سكر الدم الصائم > (120 مجم/ديسيلتر)',
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
                        dropMenuItems: cubit.fastingBloodSugarItems,
                        selectedValue: cubit.selectedFastingBloodSugar,
                        validateText: "required",
                        hintText: "register_gender_choose",
                        onChange: (value) {
                          cubit.selectedFastingBloodSugar = value.toString();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'رسم القلب في حالة الراحة',
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
                        dropMenuItems: cubit.restingElectrocardiographicItems,
                        selectedValue: cubit.selectedRestingElectrocardiographic,
                        hintText: "register_gender_choose",
                        validateText: "required",
                        onChange: (value) {
                          cubit.selectedRestingElectrocardiographic = value.toString();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'تحقيق الحد الأقصى لمعدل ضربات القلب',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        context: context,
                        controller: maximumHeartRateController,
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
                        'ممارسة الذبحة الصدرية',
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
                        dropMenuItems: cubit.exerciseInducedAnginaItems,
                        selectedValue: cubit.selectedExerciseInducedAngina,
                        hintText: "register_gender_choose",
                        validateText: "required",
                        onChange: (value) {
                          cubit.selectedExerciseInducedAngina = value.toString();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'الاكتئاب ST الناجم عن التمرين',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        context: context,
                        controller: depressionController,
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
                        'منحدر تمرين الذروة الجزء ST',
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
                        dropMenuItems: cubit.slopeOfThePeakExerciseSTItems,
                        selectedValue: cubit.selectedSlopeOfThePeakExercise,
                        hintText: "register_gender_choose",
                        validateText: "required",
                        onChange: (value) {
                          cubit.selectedSlopeOfThePeakExercise = value.toString();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'عدد الاوعية الرئيسية الملونة بواسطة الفلوروسكوبيا',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        controller: numberVesselsController,
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
                        'ثلاسيميا',
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
                        dropMenuItems: cubit.thalItems,
                        selectedValue: cubit.selectedThal,
                        hintText: "register_gender_choose",
                        validateText: "required",
                        onChange: (value) {
                          cubit.selectedThal = value.toString();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      myMaterialButton(
                          context: context,
                          labelWidget: Text(
                            "تنبأ",
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              cubit.makeHeartPrediction(
                                  age: ageController.text.toString(),
                                  sex: cubit.selectedGender == cubit.genderItems[1] ? "0" :  "1",
                                  chestPainType: cubit.selectedChestPain == cubit.chestPainItems[0] ? "0" : cubit.selectedChestPain == cubit.chestPainItems[1] ? "1": cubit.selectedChestPain == cubit.chestPainItems[2] ? "2": "3",
                                  restingBloodPressure: pressureController.text.toString(),
                                  serumCholestoral: cholestoralController.text.toString(),
                                  fastingBloodSugar: cubit.selectedFastingBloodSugar == cubit.fastingBloodSugarItems[1] ? "0" : "1",
                                  restingElectrocardiographic: cubit.selectedRestingElectrocardiographic == cubit.restingElectrocardiographicItems[0] ? "0" : cubit.selectedRestingElectrocardiographic == cubit.restingElectrocardiographicItems[1] ? "1" : "2",
                                  maximumHeartRate: maximumHeartRateController.text.toString(),
                                  exerciseInducedAngina: cubit.selectedExerciseInducedAngina == cubit.exerciseInducedAnginaItems[1] ? "0" : "1",
                                  sTDepression: depressionController.text.toString(),
                                  slopeOfThePeakExercise: cubit.selectedSlopeOfThePeakExercise == cubit.slopeOfThePeakExerciseSTItems[0] ? "0" : cubit.selectedSlopeOfThePeakExercise == cubit.slopeOfThePeakExerciseSTItems[1] ? "1" : "2",
                                  numberOfMajorVessels: numberVesselsController.text.toString(),
                                  thal: cubit.selectedThal == cubit.thalItems[0] ? "0": cubit.selectedThal == cubit.thalItems[1] ? "1" : "2",
                              );
                            }
                          },
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
        });
  }
}
