import 'package:TELEMEDICINEAPP/Presentation/Widgets/MyDrawer.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
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
      drawer: MyDrawerScreen(selected: 'Home'),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.withOpacity(0.1),
              Colors.white.withOpacity(0.1),
              Colors.blue.withOpacity(0.1),
              Colors.white.withOpacity(0.1),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),

              /// *** welcome *** /////
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'Bienvenue chez ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Telemedicine',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.lightBlue[900]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              /// *** carousel **** ///
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.45,
                  width: width,
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 6.0,
                    dotIncreasedColor: Color(0xFFFF335C),
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    borderRadius: true,
                    autoplayDuration: Duration(seconds: 10),
                    images: [
                      AssetImage('assets/slider/sliderone.jpg'),
                      AssetImage('assets/slider/slidertwo.png'),
                      AssetImage("assets/slider/sliderthree.png"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              /// *** app description **////
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  child: Text(
                    'Bureau de médecins en ligne et livraison de médicaments',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue[900]),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Container(
                  child: Text(
                    'Soins de santé dans le confort de votre maison',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.pink[100],
                child: ListTile(
                  title: Text('1-Questionnaire en ligne',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  subtitle: Text('Parlez-nous de vos antécédents médicaux.'),
                ),
              ),
              Card(
                color: Colors.pink[100],
                child: ListTile(
                  title: Text(
                    '2-Revue de l\'équipe médicale',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                      'Un de nos TN. L\'équipe médicale basée examinera tout et fera un suivi avec des questions.'),
                ),
              ),
              Card(
                color: Colors.pink[100],
                child: ListTile(
                  title: Text(
                    '3-Livraison gratuite de médicaments',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                      'Expédition sous 2 à 3 jours ouvrables, emballage discret et pas besoin de signer pour cela.'),
                ),
              ),

              SizedBox(height: 20),

              // social media
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.twitter),
                        onPressed: () async {
                          const url = 'https://www.twitter.com/bargougui_sabri';
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
                        icon: Icon(FontAwesomeIcons.instagramSquare),
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
                        icon: Icon(FontAwesomeIcons.linkedin),
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
}
