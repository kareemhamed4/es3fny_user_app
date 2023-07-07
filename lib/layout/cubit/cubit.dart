import 'package:es3fny_user_app/layout/cubit/states.dart';
import 'package:es3fny_user_app/models/login_model.dart';
import 'package:es3fny_user_app/models/prediction_model.dart';
import 'package:es3fny_user_app/modules/help_services/help_services_screen.dart';
import 'package:es3fny_user_app/modules/home/home_screen.dart';
import 'package:es3fny_user_app/modules/profile/profile_screen.dart';
import 'package:es3fny_user_app/modules/tracking/tracking_screen.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const TrackingScreen(),
    HelpServicesScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;
  void changeIndex(index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  int? voicePredictionResult;
  PredictionModel? voicePredictionModel;
  Future<void> makeVoicePrediction({
    required String message,
    required String voiceParam,
  }) async{
    emit(VoicePredictionLoadingState());
    DioHelper.postData(
        url: VOICEAPI,
        baseUrl: "https://voice-osqs.onrender.com/",
        query: {
          'message': message,
          'voice Param': voiceParam,
        }).then((value) {
      voicePredictionModel = PredictionModel.fromJson(value.data);
      voicePredictionResult = voicePredictionModel!.predictionResult;
      debugPrint(voicePredictionResult.toString());
      emit(VoicePredictionSuccessState(voicePredictionModel!));
    }).catchError((error) {
      emit(VoicePredictionErrorState());
    });
  }
}
