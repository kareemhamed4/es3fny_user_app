class LoginModel {
  bool? status;
  dynamic message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? UserData.fromJson(json["data"]) : null;
  }

  LoginModel(
      this.status,
      this.message,
      this.data,
      );
}

class UserData {
  int? id;
  int? age;
  String? name;
  String? email;
  String? nationalId;
  String? phone;
  String? gender;
  String? image;
  String? token;
  String? address;

  UserData(
      this.id,
      this.age,
      this.name,
      this.email,
      this.nationalId,
      this.phone,
      this.gender,
      this.image,
      this.token,
      this.address
      );

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    age = json["age"];
    name = json["name"];
    email = json["email"];
    nationalId = json["national_id"];
    phone = json["Phone_number"];
    gender = json["gender"];
    image = json["profile_image"];
    token = json["token"];
    address = json["address"];
  }
}
