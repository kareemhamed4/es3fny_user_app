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
    required String totalPilirubin,
    required String directBilirubin,
    required String alkalinePhosphotase,
    required String alamineAminotransferase,
    required String aspartateAminotransferase,
    required String totalProtiens,
    required String albumin,
    required String albuminAndGlobulinRatio,
  }) {
    emit(LiverPredictionLoadingState());
    DioHelper.postData(
        url: LIVERAPI,
        baseUrl: "https://liver-n5ur.onrender.com/",
        query: {
          'age': age,
          'gender': gender,
          'total_bilirubin': totalPilirubin,
          'direct_bilirubin': directBilirubin,
          'alkaline_phosphotase': alkalinePhosphotase,
          'alamine_aminotransferase': alamineAminotransferase,
          'aspartate_aminotransferase': aspartateAminotransferase,
          'total_protiens': totalProtiens,
          'albumin': albumin,
          'albumin_and_globulin_ratio': albuminAndGlobulinRatio,
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
    required String pregnancies,
    required String glucose,
    required String bloodPressure,
    required String skinThickness,
    required String insulin,
    required String bMI,
    required String diabetesPedigreeFunction,
    required String age,
  }) {
    emit(DiabetesPredictionLoadingState());
    DioHelper.postData(
        url: DIABETESAPI,
        baseUrl: "https://diabetes-802s.onrender.com/",
        query: {
          'Pregnancies': pregnancies,
          'Glucose': glucose,
          'BloodPressure': bloodPressure,
          'SkinThickness': skinThickness,
          'Insulin': insulin,
          'BMI': bMI,
          'DiabetesPedigreeFunction': diabetesPedigreeFunction,
          'Age': age,
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

  List<String> genderItems = [
    'male',
    'female',
  ];
  String selectedGender = "";

  List<String> chestPainItems = [
    'Typical Angina',
    'Atypical Angina',
    'Non-anginal Pain',
    'Asymptomatic',
  ];
  String selectedChestPain = "";

  List<String> fastingBloodSugarItems = [
    'yes',
    'no',
  ];
  String selectedFastingBloodSugar = "";

  List<String> restingElectrocardiographicItems = [
    'Normal',
    'ST-T Wave Abnormality',
    'Left Ventricular Hypertrophy',
  ];
  String selectedRestingElectrocardiographic = "";

  List<String> maximumHeartRateAchievedItems = [
    'yes',
    'no',
  ];
  String selectedMaximumHeartRateAchieved = "";

  List<String> slopeOfThePeakExerciseSTItems = [
    'Upsloping',
    'Flat',
    'Downsloping',
  ];
  String selectedSlopeOfThePeakExercise = "";

  List<String> thalItems = [
    'Normal',
    'Fixed Defect',
    'Reversable Defect',
  ];
  String selectedThal = "";
}
