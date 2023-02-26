class Test {
  String? prediction;

  Test({this.prediction});

  Test.fromJson(Map<String, dynamic> json) {
    prediction = json['prediction'];
  }
}