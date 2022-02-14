import 'package:TELEMEDICINEAPP/Presentation/Widgets/MyDrawer.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'À PROPOS DE NOUS',
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
            icon: new Icon(Icons.notifications, color: Colors.blue[100]),
            onPressed: () {
              dispatchtonotificationscreen();
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
      drawer: MyDrawerScreen(
        selected: 'About',
      ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 18),
                    Text(
                      'TELEMEDECINE',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          'Médecins et thérapeutes en qui vous pouvez avoir confiance',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          'Améliorer les soins. Réduire les coûts. Accroître l\'accès.',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.add_location,
                              size: 25,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Notre réseau de fournisseurs est le plus grand du pays et comprend des médecins certifiés en médecine interne, médecine familiale, médecine d’urgence et pédiatrie; ainsi que des professionnels de la santé mentale formés et agréés qui fournissent des services de counseling et de santé comportementale.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.add_location,
                              size: 25,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Tous nos fournisseurs passent par une vérification des antécédents avec vérification de la source principale par le biais de la National Physician Data Base (NPDB) et de l'American Medical Association (AMA) pour les licences médicales, la formation et l'éducation, les antécédents de travail et les antécédents de faute professionnelle.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                    Text(
                      'Contactez-nous dans les médias sociaux !',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.twitter),
                              onPressed: () async {
                                const url =
                                    'https://www.twitter.com/bargougui_sabri';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.facebook),
                              onPressed: () async {
                                const url =
                                    'https://www.facebook.com/sabri.benmohamed.7355';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.instagram),
                              onPressed: () async {
                                const url =
                                    'https://www.instagram.com/sabri_bargougui';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.linkedinIn),
                              onPressed: () async {
                                const url =
                                    'https://www.linkedin.com/in/sabri-bargougui';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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

  void dispatchtonotificationscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToNotificationEvent(),
    );
  }

  void dipatchtohomescreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToHomeEvent(),
    );
  }
}
