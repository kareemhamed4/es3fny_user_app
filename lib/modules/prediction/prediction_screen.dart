import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/states.dart';
import 'package:es3fny_user_app/modules/prediction/heart_prediction_screen.dart';
import 'package:es3fny_user_app/modules/prediction/liver_prediction_screen.dart';
import 'package:es3fny_user_app/modules/prediction/cancer_prediction_screen.dart';
import 'package:es3fny_user_app/modules/prediction/sugar_prediction_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiseasesModel {
  final String image;
  final String name;

  DiseasesModel({
    required this.image,
    required this.name,
  });
}

class PredictionScreen extends StatelessWidget {
  PredictionScreen({Key? key}) : super(key: key);
  final List<DiseasesModel> diseases = [
    DiseasesModel(
      image: 'assets/images/heart.png',
      name: 'Predicting heart disease',
    ),
    DiseasesModel(
      image: 'assets/images/Liver.png',
      name: 'Predicting liver disease',
    ),
    DiseasesModel(
      image: 'assets/images/diabetes.png',
      name: 'Predicting diabetes disease',
    ),
    DiseasesModel(
      image: 'assets/images/cancer.png',
      name: 'Predicting cancer disease',
    ),
  ];

  final List<Widget> predictionScreens = [
    HeartPredictionScreen(),
    LiverPredictionScreen(),
    DiabetesPredictionScreen(),
    const CancerPredictionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit, PredictionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Predicting some diseases".tr(context),
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
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/health_care.png"),
                    const SizedBox(
                      height: 38,
                    ),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildPredictionCard(
                              context: context,
                              model: diseases[index],
                              onPressed: () {
                                NavigateTo(context: context, widget: predictionScreens[index]);
                              },
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 30,
                            ),
                        itemCount: diseases.length),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPredictionCard({
    required BuildContext context,
    required DiseasesModel model,
    required Function onPressed,
  }) =>
      SizedBox(
        height: 98,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Card(
            color: Theme.of(context).cardColor,
            elevation: 5,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide.none,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          model.image,
                          width: 75,
                          height: 75,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Flexible(
                          child: Text(
                            model.name.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_outlined)
                ],
              ),
            ),
          ),
        ),
      );
}
