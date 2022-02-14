import 'dart:convert';
import 'package:TELEMEDICINEAPP/Models/User/profilemodel.dart';
import 'package:TELEMEDICINEAPP/Models/User/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Auth {
  var status;
  // register //
  Future<User> registeruser(String name, String lastname, String disease,
      String email, String cin, String phonenumber, String password) async {
    final String url = "http://10.0.2.2:3000/users/register"; //api url
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "name": name,
          "lastname": lastname,
          "disease": disease,
          "email": email,
          "cin": cin,
          "password": password,
          "phonenumber": phonenumber
        },
      ),
    );
    status = response.body.contains('error');
    final data = json.decode(response.body);
    if (status) {
      return null;
    } else
      savetoken(data["token"]);
    return savetoken(data["token"]);
  }

  // login //
  loginuser(String email, String password) async {
    final String url = "http://10.0.2.2:3000/users/login"; // api url
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    status = response.body.contains('error');
    final data = json.decode(response.body);
    if (status) {
      print('error: ${data["error"]}');
    } else {
      savetoken(data["token"]);
    }
  }

  // get user profile //
  Future<ProfileModele> getprofile() async {
    final String url = "http://10.0.2.2:3000/user/profile"; // api url
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': "${value.toString()}",
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return ProfileModele.fromJson(data['data']);
    } else {
      return null;
    }
  }

  // edit user profile //
  Future<ProfileModele> editprofile(String email, String name, String lastname,
      String cin, String phonenumber) async {
    final String url = "http://10.0.2.2:3000/user/profile"; // api url
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    final response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': "${value.toString()}",
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'lastname': lastname,
        'email': email,
        'phonenumber': phonenumber,
        'cin': cin,
      }),
    );
    status = response.body.contains('error');

    if (response.statusCode == 200 || !status) {
      var data = jsonDecode(response.body);

      return ProfileModele.fromJson(data);
    } else {
      return null;
    }
  }

  // to save token in the devise //
  savetoken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  /// to get token from the device //
  gettoken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);
    print(value);
  }
}
