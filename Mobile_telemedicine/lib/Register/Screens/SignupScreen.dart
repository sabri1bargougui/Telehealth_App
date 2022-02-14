import 'package:TELEMEDICINEAPP/Presentation/pages/navigationProvider.dart';
import 'package:TELEMEDICINEAPP/Register/bloc/register_bloc.dart';
import 'package:TELEMEDICINEAPP/Services/auth/auth.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class Singup extends StatefulWidget {
  Singup({Key key}) : super(key: key);

  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  final _formKey = GlobalKey<FormState>();
  String _myActivity;

  @override
  void initState() {
    super.initState();
    _myActivity = '';
  }

  /// *** validator key *** ////
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _cin = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Auth auth = new Auth();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'S\'inscrire',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            dispatchtologinscreen();
          },
        ),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: height * 0.45,
                width: 700,
                child: Image.asset(
                  './assets/other/myimage.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'S\'inscrire',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // ***** Form  *** ///
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // name ///
                    children: <Widget>[
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Entrez votre Prénom!',
                          labelText: 'Prénom :',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'S\'il vous plaît entrez votre nom!';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      /// **** Last Name *** //////

                      TextFormField(
                        controller: _lastname,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Entrez votre nom!',
                          labelText: 'Nom :',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez entrer votre nom  !';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      ////****** Cin ****** ////

                      TextFormField(
                        controller: _cin,
                        decoration: InputDecoration(
                          suffixIcon:
                              Icon(Icons.perm_identity, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Entrez votre Cin!',
                          labelText: 'CIN :',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez entrer votre Cin !';
                          } else if (value.length < 8) {
                            return 'Veuillez entrer valide Cin';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),

                      ////****** phonenumber ****** ////

                      TextFormField(
                        controller: _phonenumber,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Entrer votre Phone!',
                          labelText: 'PHONE :',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez entrer votre phone!';
                          } else if (value.length < 8) {
                            return 'Veuillez entrer valide phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      ////******  Email ****** ////

                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Entrer votre Email !',
                          labelText: 'Email :',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez entrer votre Email!';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Veuillez entrer valide email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),

                      /// **** disease  *** //////
                      DropDownFormField(
                        titleText: 'Maladies',
                        hintText: 'Please choose one',
                        value: _myActivity,
                        onSaved: (value) {
                          setState(() {
                            _myActivity = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _myActivity = value;
                          });
                        },
                        dataSource: [
                          {
                            "display": "Heart Disease",
                            "value": "Heart Disease",
                          },
                          {
                            "display": "Arthritis",
                            "value": "Arthritis",
                          },
                          {
                            "display": "Cancer",
                            "value": "Cancer",
                          },
                          {
                            "display": "Diabetes",
                            "value": "Diabetes",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please  Enter Your disease !';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      ////// **** Password **** ////
                      TextFormField(
                        controller: _pass,
                        key: _passwordFieldKey,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Tapez votre mot de passe',
                          labelText: 'Mot de passe :',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value.length == 0) {
                            return "Veuillez entrer le mot de passe";
                          } else if (value !=
                              _passwordFieldKey.currentState.value) {
                            return 'Veuillez entrer valide mot de passe';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      //// **** singup button **** ////

                      ProgressButton(
                        color: Colors.red[200],
                        defaultWidget: Text('S\'inscrire'),
                        progressWidget: const CircularProgressIndicator(),
                        width: 196,
                        height: 40,
                        onPressed: () async {
                          checkconnectivity();
                          if (_formKey.currentState.validate()) {
                            final name = _name.text;
                            final lastname = _lastname.text;
                            final email = _email.text;
                            final disease = _myActivity;
                            final password = _pass.text;
                            final phonenumber = _phonenumber.text;
                            final cin = _cin.text;
                            await Future.delayed(
                                const Duration(milliseconds: 3000), () => 42);
                            await auth
                                .registeruser(name, lastname, disease, email,
                                    cin, phonenumber, password)
                                .whenComplete(
                              () {
                                if (auth.status) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                      title: new Text(
                                        "L'e-mail existe déjà..!",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NavigationProvider(),
                                    ),
                                  );
                                }
                              },
                            );
                          }
                        },
                      ),

                      /// *** have an account *** ///
                      GestureDetector(
                        onTap: () {
                          dispatchtologinscreen();
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Avoir un compte?',
                            children: [
                              TextSpan(
                                text: 'connexion',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkconnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Veuillez vérifier votre connexion Internet!"),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void dispatchtologinscreen() {
    BlocProvider.of<RegisterBloc>(context).dispatch(
      GoToLoginEvent(),
    );
  }

  void dispatuploaudimagescreen() {
    BlocProvider.of<RegisterBloc>(context).dispatch(
      GoToUploadPicEvent(),
    );
  }
}
