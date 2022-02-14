import 'package:TELEMEDICINEAPP/Models/User/profilemodel.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/profile/profile-edit-overview.dart';
import 'package:TELEMEDICINEAPP/Services/auth/auth.dart';
import 'package:flutter/material.dart';

class EditingProfileScreen extends StatefulWidget {
  EditingProfileScreen({Key key}) : super(key: key);

  @override
  _EditingProfileScreenState createState() => _EditingProfileScreenState();
}

class _EditingProfileScreenState extends State<EditingProfileScreen> {
  final Auth auth = new Auth();
  Future<ProfileModele> futureProfile;
  void initState() {
    super.initState();
    futureProfile = auth.getprofile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MODIFICATION DU PROFIL',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.blue.withOpacity(0.8)),
            clipper: GetClipper(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'MODIFIER VOTRE PROFIL',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900]),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: FutureBuilder<ProfileModele>(
              future: futureProfile,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return EditingProfileIverView(
                      snapshot.data.name,
                      snapshot.data.lastname,
                      snapshot.data.email,
                      snapshot.data.cin,
                      snapshot.data.phonenumber);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // todo: implement shouldReclip
    return true;
  }
}
