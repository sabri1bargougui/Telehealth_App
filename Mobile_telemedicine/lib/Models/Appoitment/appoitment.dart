import 'dart:convert';

Appoitment appoitmentFromJson(String str) =>
    Appoitment.fromJson(json.decode(str));

String appoitmentToJson(Appoitment data) => json.encode(data.toJson());

class Appoitment {
  Appoitment({
    this.id,
    this.name,
    this.lastname,
    this.phonenumber,
    this.doctor,
    this.date,
    this.isaccepted,
  });
  String id;
  String name;
  String lastname;
  int phonenumber;
  String doctor;
  String date;
  String isaccepted;

  factory Appoitment.fromJson(Map<String, dynamic> json) => Appoitment(
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        phonenumber: json["phonenumber"],
        doctor: json["doctor"],
        date: json["date"],
        isaccepted: json["isaccepted"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "lastname": lastname,
        "phonenumber": phonenumber,
        "doctor": doctor,
        "date": date,
        "isaccepted": isaccepted,
      };
}
