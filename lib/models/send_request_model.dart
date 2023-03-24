class SendRequestModel {
  bool? status;
  String? message;
  Data? data;

  SendRequestModel({this.status, this.message, this.data});

  SendRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  int? status;
  String? palmerData;
  UserData? userData;

  Data({this.id, this.status, this.palmerData, this.userData});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    palmerData = json['palmer_data'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }

}

class UserData {
  String? name;
  String? address;
  String? phone;
  String? image;

  UserData({this.name, this.address, this.phone, this.image});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
  }
}
