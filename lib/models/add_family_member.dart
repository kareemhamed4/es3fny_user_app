class AddFamilyMember {
  bool? status;
  String? message;
  MemberDetails? user;

  AddFamilyMember(this.status, this.message, this.user);

  AddFamilyMember.fromJson(Map<String,dynamic> json){
    status = json["status"];
    message = json["message"];
    user = json["user"] != null ? MemberDetails.fromJson(json["user"]) : null;
  }
}

class MemberDetails {
  int? userId;
  int? memberId;
  String? name;
  String? phone;
  String? kinship;

  MemberDetails(this.userId, this.memberId, this.name, this.phone, this.kinship);

  MemberDetails.fromJson(Map<String,dynamic> json){
    userId = json["id_for_user"];
    memberId = json["id_for_member"];
    name = json["name"];
    phone = json["Phone_number"];
    kinship = json["kinship"];
  }
}