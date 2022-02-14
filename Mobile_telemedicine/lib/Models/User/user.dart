import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.lastname,
    this.disease,
    this.email,
    this.cin,
    this.phonenumber,
    this.password,
  });

  String name;
  String lastname;
  String disease;
  String email;
  String cin;
  String phonenumber;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        lastname: json["lastname"],
        disease: json["disease"],
        email: json["email"],
        cin: json["cin"],
        phonenumber: json["phonenumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "disease": disease,
        "email": email,
        "cin": cin,
        "phonenumber": phonenumber,
        "password": password,
      };
}
