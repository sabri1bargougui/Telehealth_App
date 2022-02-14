import 'package:TELEMEDICINEAPP/Presentation/Widgets/MyDrawer.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NOTIFICATIONS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              dipatchtohomescreen();
            },
          ),
          IconButton(
            icon: new Icon(Icons.message, color: Colors.blue[100]),
            onPressed: () {
              dispatchtomessagescreen();
            },
          ),
        ],
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      drawer: MyDrawerScreen(selected: 'notification'),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[200],
              Colors.blue[200],
              Colors.blue[200],
              Colors.blue[200],
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),

              /// **** messages **** ///
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward), // view analys
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Covid19', // analys name
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 15),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            'Soyez prudent, respectez la distanciation sociale et lavez fréquemment les mains', // analys date
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward), // view analys
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Rendez-Vous', // analys name
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 15),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            'votre rendez-vous a été accepté', // analys date
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ////**** end messages **** ///
            ],
          ),
        ),
      ),
    );
  }

  void dispatchtomessagescreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToChatEvent(),
    );
  }

  void dipatchtohomescreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToHomeEvent(),
    );
  }
}
