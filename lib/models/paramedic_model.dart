class ParamedicModel {
  bool? status;
  String? message;
  PlamerData? plamerData;

  ParamedicModel({this.status, this.message, this.plamerData});

  ParamedicModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    plamerData = json['Plamer_data'] != null
        ? PlamerData.fromJson(json['Plamer_data'])
        : null;
  }
}

class PlamerData {
  String? name;
  String? address;
  String? unit;
  String? carNumber;
  String? phoneNumber;
  String? image;

  PlamerData(
      {this.name,
        this.address,
        this.unit,
        this.carNumber,
        this.phoneNumber,
        this.image});

  PlamerData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    unit = json['unit'];
    carNumber = json['car_number'];
    phoneNumber = json['phone_number'];
    image = json['image'];
  }
}
