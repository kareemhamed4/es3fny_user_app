class TreatmentDetails {
  String? treatmentName;
  int? quantity;
  List<String>? selectedDates;
  String? startDate;
  String? endDate;
  String? time;

  TreatmentDetails(
      {this.treatmentName,
        this.quantity,
        this.selectedDates,
        this.startDate,
        this.endDate,
        this.time});

  TreatmentDetails.fromJson(Map<String, dynamic> json) {
    treatmentName = json['treatment_name'];
    quantity = json['quantity'];
    selectedDates = json['selectedDates'].cast<String>();
    startDate = json['startDate'];
    endDate = json['endDate'];
    time = json['time'];
  }
}