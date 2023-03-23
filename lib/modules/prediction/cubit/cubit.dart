import 'package:es3fny_user_app/models/test.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/states.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictionCubit extends Cubit<PredictionStates> {
  PredictionCubit() : super(PredictionInitialState());

  static PredictionCubit get(context) => BlocProvider.of(context);

  String? heartPredictionResult;
  PredictionModel? heartPredictionModel;
  void makeHeartPrediction({
    required String age,
    required String sex,
    required String cp,
    required String trestbps,
    required String chol,
    required String fbs,
    required String restecg,
    required String thalach,
    required String exang,
    required String oldpeak,
    required String slope,
    required String ca,
    required String thal,
  }) {
    emit(HeartPredictionLoadingState());
    DioHelper.postData(
        url: HEARTAPI,
        baseUrl: "https://heart-rws6.onrender.com/",
        query: {
          'age': age,
          'sex': sex,
          'cp': cp,
          'trestbps': trestbps,
          'chol': chol,
          'fbs': fbs,
          'restecg': restecg,
          'thalach': thalach,
          'exang': exang,
          'oldpeak': oldpeak,
          'slope': slope,
          'ca': ca,
          'thal': thal,
        }).then((value) {
      debugPrint(value.data.toString());
      heartPredictionModel = PredictionModel.fromJson(value.data);
      heartPredictionResult = heartPredictionModel!.predictionResult;
      emit(HeartPredictionSuccessState(heartPredictionModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(HeartPredictionErrorState());
    });
  }


  String? liverPredictionResult;
  PredictionModel? liverPredictionModel;
  void makeLiverPrediction({
    required String age,
    required String gender,
    required String total_bilirubin,
    required String direct_bilirubin,
    required String alkaline_phosphotase,
    required String alamine_aminotransferase,
    required String aspartate_aminotransferase,
    required String total_protiens,
    required String albumin,
    required String albumin_and_globulin_ratio,
  }) {
    emit(LiverPredictionLoadingState());
    DioHelper.postData(
        url: LIVERAPI,
        baseUrl: "https://liver-n5ur.onrender.com/",
        query: {
          'age': age,
          'gender': gender,
          'total_bilirubin': total_bilirubin,
          'direct_bilirubin': direct_bilirubin,
          'alkaline_phosphotase': alkaline_phosphotase,
          'alamine_aminotransferase': alamine_aminotransferase,
          'aspartate_aminotransferase': aspartate_aminotransferase,
          'total_protiens': total_protiens,
          'albumin': albumin,
          'albumin_and_globulin_ratio': albumin_and_globulin_ratio,
        }).then((value) {
      debugPrint(value.data.toString());
      liverPredictionModel = PredictionModel.fromJson(value.data);
      liverPredictionResult = liverPredictionModel!.predictionResult;
      emit(LiverPredictionSuccessState(liverPredictionModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LiverPredictionErrorState());
    });
  }


  String? diabetesPredictionResult;
  PredictionModel? diabetesPredictionModel;
  void makeDiabetesPrediction({
    required String Pregnancies,
    required String Glucose,
    required String BloodPressure,
    required String SkinThickness,
    required String Insulin,
    required String BMI,
    required String DiabetesPedigreeFunction,
    required String Age,
  }) {
    emit(DiabetesPredictionLoadingState());
    DioHelper.postData(
        url: DIABETESAPI,
        baseUrl: "https://diabetes-802s.onrender.com/",
        query: {
          'Pregnancies': Pregnancies,
          'Glucose': Glucose,
          'BloodPressure': BloodPressure,
          'SkinThickness': SkinThickness,
          'Insulin': Insulin,
          'BMI': BMI,
          'DiabetesPedigreeFunction': DiabetesPedigreeFunction,
          'Age': Age,
        }).then((value) {
      debugPrint(value.data.toString());
      diabetesPredictionModel = PredictionModel.fromJson(value.data);
      diabetesPredictionResult = diabetesPredictionModel!.predictionResult;
      emit(DiabetesPredictionSuccessState(diabetesPredictionModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DiabetesPredictionErrorState());
    });
  }
}
