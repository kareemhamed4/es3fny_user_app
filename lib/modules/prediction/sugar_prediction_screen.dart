import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiabetesPredictionScreen extends StatelessWidget {
  DiabetesPredictionScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pregnanciesController = TextEditingController();
  final TextEditingController glucoseController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController skinThicknessController = TextEditingController();
  final TextEditingController insulinController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController diabetesPedigreeFunctionController =
      TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit, PredictionStates>(
        listener: (context, state) {
      if (state is DiabetesPredictionSuccessState) {
        if (state.diabetesModel.predictionResult == 0) {
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
        } else {
          showMyDialog(
            context: context,
            titleWidget: Text(
              "احتمال اصابتك بالمرض كبير",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            contentWidget: Text(
              "الرجاء التوجة الي طبيب متخصص في اقرب وقت",
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
            ),
            confirmText: "حسناً",
            isCancelButton: false,
            onConfirm: () {
              Navigator.pop(context);
            },
          );
        }
      }
    }, builder: (context, state) {
      Size size = MediaQuery.of(context).size;
      PredictionCubit cubit = BlocProvider.of(context);
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "التنبؤ بمرض السكري",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
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
                    'عدد حالات الحمل',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    controller: pregnanciesController,
                    context: context,
                    hint: "",
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
                    'الجلوكوز',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    controller: glucoseController,
                    context: context,
                    hint: "",
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
                    'ضغط الدم',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    controller: bloodPressureController,
                    context: context,
                    hint: "",
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
                    'سمك الجلد',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    controller: skinThicknessController,
                    context: context,
                    hint: "",
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
                    'الأنسولين',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    controller: insulinController,
                    context: context,
                    hint: "",
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
                    'مؤشر كتلة الجسم = الوزن(كجم) /( الطول(م) * الطول(م))',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    controller: bmiController,
                    context: context,
                    hint: "",
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
                    'عدد افراد العائلة المصابين بالسكرى',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  myTextFormField(
                    controller: diabetesPedigreeFunctionController,
                    context: context,
                    hint: "",
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
                    hint: "",
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
                    height: size.height * 0.04,
                  ),
                  ConditionalBuilder(
                    condition: state is! DiabetesPredictionLoadingState,
                    builder: (context) => myMaterialButton(
                      context: context,
                      labelWidget: Text(
                        "تنبأ",
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (context.read<MainCubit>().hasInternet) {
                            cubit.makeDiabetesPrediction(
                              pregnancies: pregnanciesController.text,
                              glucose: glucoseController.text,
                              bloodPressure: bloodPressureController.text,
                              skinThickness: skinThicknessController.text,
                              insulin: insulinController.text,
                              bMI: bmiController.text,
                              diabetesPedigreeFunction:
                                  diabetesPedigreeFunctionController.text,
                              age: ageController.text,
                            );
                          } else {
                            showNoInternetDialog(context: context);
                          }
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
    });
  }
}
