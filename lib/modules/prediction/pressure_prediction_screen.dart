import 'package:es3fny_user_app/modules/prediction/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/states.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PressurePredictionScreen extends StatelessWidget {
  const PressurePredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit,PredictionStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "التنبؤ بمرض الضغط",
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "قريباً...",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 22,color: myFavColor2),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
