import 'package:TELEMEDICINEAPP/splashScreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'ingection/ingection.dart' as sl;
import 'Register/pages/registerProvider.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => RegisterProvider(),
};

void main() {
  sl.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenn(),
      routes: routes,
    );
  }
}
