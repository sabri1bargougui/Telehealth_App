import 'package:TELEMEDICINEAPP/Presentation/pages/navigationProvider.dart';
import 'package:TELEMEDICINEAPP/Register/bloc/register_bloc.dart';
import 'package:TELEMEDICINEAPP/Services/auth/auth.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  /// *** validator key *** ////
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  /// **** variable state **** ///
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  String animationType = "idle";

///// **** animation state *** ////
  @override
  void initState() {
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else
        setState(() {
          animationType = "idle";
        });
    });
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else
        setState(() {
          animationType = "idle";
        });
    });
    super.initState();
  }

  final Auth auth = new Auth();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      key: _scaffoldKey,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: height * 0.45,
                width: width,
                child: FlareActor("assets/teddyy_test.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: animationType),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Connexion',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //***** Email******/
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.mail, color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Entrer votre Email !',
                          labelText: 'EMAIL :',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Entrer votre Email !';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Entrer valide Email';
                          }
                          return null;
                        },
                        focusNode: emailFocusNode,
                        controller: emailController,
                      ),

                      SizedBox(height: 40),

                      //***** password ******/

                      TextFormField(
                        key: _passwordFieldKey,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Tapez votre mot de passe!',
                          labelText: 'MOT DE PASSE :',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez entrer un mot de passe!';
                          } else if (value !=
                              _passwordFieldKey.currentState.value) {
                            return 'Le mot de passe ne correspond pas';
                          }
                          return null;
                        },
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                      ),

                      // *** Forgot password *** //

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              dispatchtoforgotpassowrdscreen();
                            },
                            child: Text(
                              'Mot de passe oublié?',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),

                      //***Login button ****//

                      ProgressButton(
                        color: Colors.red[200],
                        defaultWidget: Text('Connexion'),
                        progressWidget: const CircularProgressIndicator(),
                        width: 196,
                        height: 40,
                        onPressed: () async {
                          checkconnectivity();
                          if (_formKey.currentState.validate()) {
                            final email = emailController.text;
                            final password = passwordController.text;
                            setState(() {
                              animationType = "success";
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 3000), () => 42);
                            await auth.loginuser(email, password).whenComplete(
                              () {
                                if (auth.status) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                      title: new Text(
                                        "Veuillez vérifier votre e-mail ou votre mot de passe !",
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
                                  setState(() {
                                    animationType = "fail";
                                  });
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
                          } else {
                            setState(() {
                              animationType = "fail";
                            });
                          }
                        },
                      ),
                      SizedBox(height: 22),

                      /// *** dont  have an account *** ///
                      GestureDetector(
                        onTap: () {
                          dispatchtosignupscreen();
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'tu n\'as pas de compte',
                            children: [
                              TextSpan(
                                text: 'S\'inscrire',
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

  void dispatchtosignupscreen() {
    BlocProvider.of<RegisterBloc>(context).dispatch(
      GoToRegisterEvent(),
    );
  }

  void dispatchtoforgotpassowrdscreen() {
    BlocProvider.of<RegisterBloc>(context).dispatch(
      GoToForgotPasswordEvent(),
    );
  }

  void checkconnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Please check your Internet connexion !"),
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
}
