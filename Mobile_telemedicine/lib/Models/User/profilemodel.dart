// To parse this JSON data, do
//
//     final profileModele = profileModeleFromJson(jsonString);

import 'dart:convert';

ProfileModele profileModeleFromJson(String str) =>
    ProfileModele.fromJson(json.decode(str));

String profileModeleToJson(ProfileModele data) => json.encode(data.toJson());

class ProfileModele {
  ProfileModele({
    this.name,
    this.lastname,
    this.disease,
    this.email,
    this.cin,
    this.phonenumber,
  });

  String id;
  String name;
  String lastname;
  String disease;
  String email;
  String cin;
  String phonenumber;

  factory ProfileModele.fromJson(Map<String, dynamic> json) => ProfileModele(
        name: json["name"],
        lastname: json["lastname"],
        disease: json["disease"],
        email: json["email"],
        cin: json["cin"].toString(),
        phonenumber: json["phonenumber"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "disease": disease,
        "email": email,
        "cin": cin,
        "phonenumber": phonenumber,
      };
}
