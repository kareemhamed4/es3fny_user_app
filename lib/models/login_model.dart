class LoginModel {
  bool? status;
  String? errNum;
  String? msg;
  Data? data;

  LoginModel({this.status, this.errNum, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  int? age;
  String? name;
  int? gender;
  String? email;
  String? latitude;
  String? longitude;
  String? nationalId;
  String? phoneNumber;
  String? profileImage;
  String? token;
  bool? isBlind;

  Data(
      {this.id,
        this.age,
        this.name,
        this.gender,
        this.email,
        this.latitude,
        this.longitude,
        this.nationalId,
        this.phoneNumber,
        this.profileImage,
        this.token,
        this.isBlind,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    name = json['name'];
    gender = json['gender'];
    email = json['email'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    nationalId = json['national_id'];
    phoneNumber = json['Phone_number'];
    profileImage = json['profile_image'];
    token = json['token'];
    isBlind = json['isBlind'];
  }
}
