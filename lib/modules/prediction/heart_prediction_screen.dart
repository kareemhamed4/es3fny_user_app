import 'package:es3fny_user_app/modules/prediction/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartPredictionScreen extends StatelessWidget {
  const HeartPredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit,PredictionStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "التنبؤ بمرض القلب",
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
            child: Column(
              children: [
                Text(
                  "ساعدنا ببعض الاسئلة",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24,color: myFavColor),
                ),
                const SizedBox(height: 6,),
                Text(
                  "معلومات شخصية",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 21),
                ),
                const SizedBox(height: 33,),
                myTextFormField(context: context),
              ],
            ),
          ),
        );
    }
    );
  }
}
