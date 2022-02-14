import 'package:TELEMEDICINEAPP/Services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class EditingProfileIverView extends StatelessWidget {
  final String name;
  final String lastname;
  final String email;
  final String cin;
  final String phonenumber;

  const EditingProfileIverView(
      this.name, this.lastname, this.email, this.cin, this.phonenumber);

  @override
  Widget build(BuildContext context) {
    TextEditingController _phonenumber = TextEditingController();
    TextEditingController _name = TextEditingController();
    TextEditingController _lastname = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _cin = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    /// *** validator key *** ////
    final RegExp emailRegex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    final Auth auth = new Auth();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 200, left: 5, right: 5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person, color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      hintText: name,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      labelText: 'Name :',
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'please enter your Name !';
                    }
                    return null;
                  },
                  //   onSaved: (value) => _name = value,
                ),
                SizedBox(height: 15),

                /// **** Last Name *** //////

                TextFormField(
                  controller: _lastname,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person, color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: lastname,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    labelText: 'Last Name :',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please  Enter Your Last Name !';
                    }
                    return null;
                  },
                  // onSaved: (value) => _lastname = value,
                ),
                SizedBox(height: 15),

                ////****** Cin ****** ////
                TextFormField(
                  controller: _cin,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.perm_identity, color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: cin,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    labelText: 'CIN :',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'please enter your Cin !';
                    } else if (value.length < 8) {
                      return 'Please enter valid Cin';
                    }
                    return null;
                  },
                  //   onSaved: (value) => _cin = value,
                ),
                SizedBox(height: 15.0),

                ////****** phonenumber ****** ////

                TextFormField(
                  controller: _phonenumber,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.phone, color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: phonenumber,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    labelText: 'PHONE :',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'please enter your Phone Number !';
                    } else if (value.length < 8) {
                      return 'Please enter valid Phone Number';
                    }
                    return null;
                  },
                  //  onSaved: (value) => _phonenumber = value,
                ),
                SizedBox(height: 15.0),

                SizedBox(height: 15.0),
                ////******  Email ****** ////

                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email, color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: email,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    labelText: 'Email :',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'please enter your email !';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  // onSaved: (value) => _email = value,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25.0),
        // submit button ** //
        ProgressButton(
          color: Colors.red[200],
          defaultWidget: Text('Submit'),
          progressWidget: const CircularProgressIndicator(),
          width: 196,
          height: 40,
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              final name = _name.text;
              final lastname = _lastname.text;
              final phonenumber = _phonenumber.text;
              final cin = _cin.text;
              final email = _email.text;

              await Future.delayed(
                  const Duration(milliseconds: 3000), () => 42);
              auth
                  .editprofile(email, name, lastname, cin, phonenumber)
                  .whenComplete(
                () {
                  if (auth.status) {
                    showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        title: new Text(
                          "Please Try again..!",
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
                  }
                },
              );
              return () {
                Navigator.of(context).pop();
              };
            }
          },
        ),

        // *** end submit button //
        SizedBox(height: 25.0),
      ],
    );
  }
}
