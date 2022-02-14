import 'package:TELEMEDICINEAPP/Register/pages/registerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenn extends StatefulWidget {
  @override
  _SplashScreennState createState() => _SplashScreennState();
}

class _SplashScreennState extends State<SplashScreenn> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: RegisterProvider(),
        title: new Text(
          'Bienvenue chez Telemedicine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        image: new Image.asset('assets/splashscreen/logo.png'),
        backgroundColor: Colors.blue[50],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
