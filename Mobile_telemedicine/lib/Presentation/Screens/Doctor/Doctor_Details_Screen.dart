import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorsDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageURL;
  final String age;
  final String specialization;
  DoctorsDetailsScreen(this.title, this.description, this.imageURL, this.age,
      this.specialization);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.black.withOpacity(0.8)),
            clipper: GetClipper(),
          ),
          Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 8,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage(imageURL), fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ])),
                  SizedBox(height: 90.0),
                  Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(height: 15.0),
                      Card(
                        child: Text(
                          age, //age
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
                          specialization, // spesialization
                          style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Card(
                          child: ReadMoreText(
                            description,
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Montre plus',
                            trimExpandedText: 'Montrer moins',
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      // ***  social media *** ///
                      // social media
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
                ],
              ),
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
    // todo: implement shouldReclip//
    return true;
  }
}
