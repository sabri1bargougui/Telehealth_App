import 'dart:convert';
import 'package:TELEMEDICINEAPP/Models/Analys/analys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnalysData {
  var status;
  // get user analys //http://10.0.2.2:3000
  getanalys() async {
    final String url = "http://10.0.2.2:3000/user/analys"; // api url
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
    status = response.body.contains('error');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Analys> analys = [];
      for (var item in data) {
        analys.add(Analys.fromJson(item));
      }
      return analys;
    } else {
      return null;
    }
  }
}
