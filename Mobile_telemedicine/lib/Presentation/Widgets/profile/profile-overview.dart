import 'package:flutter/material.dart';

class ProfileOverview extends StatelessWidget {
  final String name;
  final String lastname;
  final String disease;
  final String email;
  final String cin;
  final String phonenumber;

  const ProfileOverview(this.name, this.lastname, this.disease, this.email,
      this.cin, this.phonenumber);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ' ${name.toUpperCase()} ${lastname.toUpperCase()}',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        SizedBox(height: 15.0),
        Card(
          child: Text(
            email,
            style: TextStyle(
              fontSize: 17.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Card(
          child: Text(
            cin,
            style: TextStyle(
              fontSize: 17.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Card(
          child: Text(
            phonenumber,
            style: TextStyle(
              fontSize: 17.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Card(
          color: Colors.cyanAccent,
          child: Text(
            disease.toUpperCase(),
            style: TextStyle(
              fontSize: 17.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
