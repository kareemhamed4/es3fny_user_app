class Family {
  int? id;
  String? name;
  String? phoneNumber;
  String? kinship;
  int? userId;

  Family({
    this.id,
    this.name,
    this.phoneNumber,
    this.kinship,
    this.userId,
  });

  Family.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    kinship = json['kinship'];
    userId = json['user_id'];
  }
}
