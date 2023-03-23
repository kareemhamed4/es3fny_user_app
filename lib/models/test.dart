class PredictionModel {
  String? predictionResult;

  PredictionModel({this.predictionResult});

  PredictionModel.fromJson(Map<String, dynamic> json) {
    predictionResult = json['prediction'];
  }
}