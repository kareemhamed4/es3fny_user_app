class ParamedicModel {
  bool? status;
  String? errNum;
  String? msg;
  Data? data;

  ParamedicModel({this.status, this.errNum, this.msg, this.data});

  ParamedicModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? latitude;
  String? longitude;
  String? government;
  String? city;
  String? unitName;
  String? carNumber;
  int? status;
  String? nationalId;
  String? phoneNumber;
  String? profileImage;
  String? token;
  String? distance;
  int? requesId;

  Data(
      {this.id,
        this.name,
        this.email,
        this.latitude,
        this.longitude,
        this.government,
        this.city,
        this.unitName,
        this.carNumber,
        this.status,
        this.nationalId,
        this.phoneNumber,
        this.profileImage,
        this.token,
        this.distance,
        this.requesId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    government = json['government'];
    city = json['city'];
    unitName = json['unit_name'];
    carNumber = json['car_number'];
    status = json['status'];
    nationalId = json['national_id'];
    phoneNumber = json['Phone_number'];
    profileImage = json['profile_image'];
    token = json['token'];
    distance = json['distance'];
    requesId = json['reques_id'];
  }
}
