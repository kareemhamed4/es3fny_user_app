class Family {
  bool? status;
  String? errNum;
  String? msg;
  List<Data>? data;

  Family({this.status, this.errNum, this.msg, this.data});

  Family.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? name;
  String? phoneNumber;
  String? kinship;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.phoneNumber,
        this.kinship,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    kinship = json['kinship'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
