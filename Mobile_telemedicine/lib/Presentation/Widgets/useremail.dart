import 'package:flutter/material.dart';

class UserEmail extends StatelessWidget {
  final String email;
  final String name;
  final String lastName;

  const UserEmail(this.email, this.lastName, this.name);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      accountEmail: Text('$email'),
      accountName: Text('$name $lastName'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage(
          "assets/other/marc.jpg",
        ),
      ),
    );
  }
}
