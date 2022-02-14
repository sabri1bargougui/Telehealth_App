import 'dart:convert';
import 'package:TELEMEDICINEAPP/Models/Appoitment/appoitment.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppoitmentData {
  var status;
  // make appoitment  //
  makeappoitment(
    String name,
    String lastname,
    String phonenumber,
    String doctor,
    String date,
  ) async {
    final String url = "http://10.0.2.2:3000/user/appoitment"; // api url
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': "${value.toString()}",
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'lastname': lastname,
        'phonenumber': phonenumber,
        'doctor': doctor,
        'date': date,
      }),
    );
    status = response.body.contains('error');
    final data = json.decode(response.body);
    if (status) {
      return null;
    } else
      return Appoitment.fromJson(data);
  }

  // get user appoitment //

  getappoitment() async {
    final String url = "http://10.0.2.2:3000/user/appoitment"; // api url
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': "${value.toString()}",
      },
    );
    status = response.body.contains('error');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Appoitment> appoitments = [];
      for (var item in data) {
        appoitments.add(Appoitment.fromJson(item));
      }
      return appoitments;
    } else
      return status;
  }

  // delete  user appoitment //

  Future<Appoitment> deleteappoitment(String id) async {
    final String url = "http://10.0.2.2:3000/user/appoitment/$id"; // api url
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    final http.Response response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': "${value.toString()}",
      },
    );
    status = response.body.contains('error');
    final data = json.decode(response.body);
    if (status) {
      return null;
    } else
      return Appoitment.fromJson(data);
  }
}
