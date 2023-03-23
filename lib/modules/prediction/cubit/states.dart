import 'package:es3fny_user_app/models/test.dart';

abstract class PredictionStates {}
class PredictionInitialState extends PredictionStates {}

class LiverPredictionLoadingState extends PredictionStates {}
class LiverPredictionSuccessState extends PredictionStates {
  final PredictionModel liverModel;
  LiverPredictionSuccessState(this.liverModel);
}
class LiverPredictionErrorState extends PredictionStates {}

class HeartPredictionLoadingState extends PredictionStates {}
class HeartPredictionSuccessState extends PredictionStates {
  final PredictionModel heartModel;
  HeartPredictionSuccessState(this.heartModel);
}
class HeartPredictionErrorState extends PredictionStates {}

class DiabetesPredictionLoadingState extends PredictionStates {}
class DiabetesPredictionSuccessState extends PredictionStates {
  final PredictionModel diabetesModel;
  DiabetesPredictionSuccessState(this.diabetesModel);
}
class DiabetesPredictionErrorState extends PredictionStates {}