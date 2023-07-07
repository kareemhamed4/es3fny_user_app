import 'package:es3fny_user_app/models/prediction_model.dart';

abstract class LayoutStates {}
class LayoutInitialState extends LayoutStates {}
class ChangeBottomNavBarState extends LayoutStates {}

class VoicePredictionLoadingState extends LayoutStates {}
class VoicePredictionSuccessState extends LayoutStates {
  final PredictionModel voiceModel;
  VoicePredictionSuccessState(this.voiceModel);
}
class VoicePredictionErrorState extends LayoutStates {}