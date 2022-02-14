import 'package:TELEMEDICINEAPP/Models/User/profilemodel.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/useremail.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:TELEMEDICINEAPP/Register/pages/registerProvider.dart';
import 'package:TELEMEDICINEAPP/Services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawerScreen extends StatefulWidget {
  final String selected;

  const MyDrawerScreen({Key key, @required this.selected}) : super(key: key);

  @override
  _MyDrawerScreenState createState() => _MyDrawerScreenState();
}

class _MyDrawerScreenState extends State<MyDrawerScreen> {
  final Auth auth = new Auth();
  Future<ProfileModele> futureProfile;
  void initState() {
    super.initState();
    futureProfile = auth.getprofile();
  }

  @override
  Widget build(BuildContext context) {
    String selected = widget.selected;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // **** Drawer Header *** ///
          FutureBuilder<ProfileModele>(
            future: futureProfile,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return UserEmail(
                  snapshot.data.email,
                  snapshot.data.name,
                  snapshot.data.lastname,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
          SizedBox(height: 10),

          /// *** Home *** ////
          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor:
                  selected == 'Home' ? Colors.blueGrey[100] : Colors.white,
              title: Text(
                'Accueil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              leading: Icon(Icons.home),
              onTap: () {
                dipatchtohomescreen();
              },
            ),
          ),

          SizedBox(height: 10),

          /// **** Profile **** ///
          Theme(
            data: ThemeData(
              highlightColor: Colors.blueGrey,
            ),
            child: ListTile(
              tileColor:
                  selected == 'Profile' ? Colors.blueGrey[100] : Colors.white,
              title: Text(
                'Profil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              leading: Icon(Icons.person),
              onTap: () {
                dispatchtopprofilescreen();
              },
            ),
          ),
          SizedBox(height: 10),

          /// *****Analysis ***  ////
          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor:
                  selected == 'Analysis' ? Colors.blueGrey[100] : Colors.white,
              title: Text(
                'Analyses',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              leading: Icon(Icons.analytics),
              onTap: () {
                dispatchtoanalysysscreen();
              },
            ),
          ),

          SizedBox(height: 10),

          /// ***** Our Doctors *** ////

          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor:
                  selected == 'Doctors' ? Colors.blueGrey[100] : Colors.white,
              title: Text(
                'Nos médecins',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              leading: Icon(Icons.dock),
              onTap: () {
                dispatchtodoctorsscreen();
              },
            ),
          ),

          SizedBox(height: 10),
          Divider(), //here is a divider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Rendez-vous"),
          ),

          /// ***** appointment *** ////

          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor: selected == 'AppoitmentScreen'
                  ? Colors.blueGrey[100]
                  : Colors.white,
              title: Text(
                'Rendez-vous',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              leading: Icon(Icons.article),
              onTap: () {
                dispatchtoappoitmentscreen();
              },
            ),
          ),

          SizedBox(height: 10),

          /// ***** historique  appointment *** ////

          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor: selected == 'HistoricalAppointment'
                  ? Colors.blueGrey[100]
                  : Colors.white,
              title: Text(
                'Historique des rendez-vous ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              leading: Icon(Icons.article),
              onTap: () {
                dispatchtohistoricalappoitmentscreen();
              },
            ),
          ),

          SizedBox(height: 10),
          Divider(), //here is a divider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("What's app"),
          ),

          /// ***** Chat Bots *** ////

          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor: selected == 'MessageScreen'
                  ? Colors.blueGrey[100]
                  : Colors.white,
              title: Text(
                'Chat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              leading: Icon(Icons.message),
              onTap: () {
                dispatchtochatscreen();
              },
            ),
          ),

          SizedBox(height: 10),

          /// *****Newes *** ////

          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor:
                  selected == 'News' ? Colors.blueGrey[100] : Colors.white,
              title: Text(
                'News',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              leading: Icon(Icons.new_releases),
              onTap: () {
                dispatchtonewsscreen();
              },
            ),
          ),
          SizedBox(height: 10),

          /// ***** Notifications *** ////

          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor: selected == 'notification'
                  ? Colors.blueGrey[100]
                  : Colors.white,
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              leading: Icon(Icons.notification_important),
              onTap: () {
                dispatchtonotificationscreen();
              },
            ),
          ),
          SizedBox(height: 10),
          Divider(), //here is a divider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("À propos"),
          ),

          /// *****About Us ***   ////

          Theme(
            data: ThemeData(
              highlightColor: Colors.red,
            ),
            child: ListTile(
              tileColor:
                  selected == 'About' ? Colors.blueGrey[100] : Colors.white,
              title: Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              leading: Icon(Icons.add_box_outlined),
              onTap: () {
                dispatchtoaboutscreen();
              },
            ),
          ),
          SizedBox(height: 10),

          /// **** logout button ***///
          ProgressButton(
            animate: false,
            color: Colors.red,
            defaultWidget: Text('Deconnexion'),
            progressWidget: const CircularProgressIndicator(),
            width: 196,
            height: 40,
            onPressed: () async {
              await Future.delayed(
                const Duration(milliseconds: 3000),
                () => 42,
              );
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('x-access-token');

              return () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => RegisterProvider()),
                  ModalRoute.withName('/'),
                );
              };
            },
          ),

          // ** end logout butto **//
        ],
      ),
    );
  }
  //**  method go to  home screen */

  void dipatchtohomescreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToHomeEvent(),
    );
  }
  //**  method go to  profile screen */

  void dispatchtopprofilescreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToProfileEvent(),
    );
  }
  //**  method go to  analys screen */

  void dispatchtoanalysysscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToAnalysEvent(),
    );
  }
  //**  method go to  doctors screen */

  void dispatchtodoctorsscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToDoctorsEvent(),
    );
  }
  //**  method go to  appoitment screen */

  void dispatchtoappoitmentscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToAppoitmenEvent(),
    );
  }
  //**  method go to  hytorical  screen */

  void dispatchtohistoricalappoitmentscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToAppoitmentHistoricalEvent(),
    );
  }
  //**  method go to  chat screen */

  void dispatchtochatscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToChatEvent(),
    );
  }
  //**  method go to  news screen */

  void dispatchtonewsscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToNewsEvent(),
    );
  }
  //**  method go to  notification screen */

  void dispatchtonotificationscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToNotificationEvent(),
    );
  }

  //**  method go to  about screen */

  void dispatchtoaboutscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToAboutEvent(),
    );
  }
}
