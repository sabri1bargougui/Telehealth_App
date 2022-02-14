import 'package:TELEMEDICINEAPP/Models/Appoitment/appoitment.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/MyDrawer.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/appoitment/appoitment_hys.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:TELEMEDICINEAPP/Services/appoitment/appoitment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricScreen extends StatefulWidget {
  HistoricScreen({Key key}) : super(key: key);
  @override
  _HistoricScreenState createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {
  final AppoitmentData appoitmentdata = new AppoitmentData();

  @override
  void initState() {
    appoitmentdata.getappoitment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Dernier rendez-vous',
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
      drawer: MyDrawerScreen(selected: 'HistoricalAppointment'),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Vos derniers rendez-vous',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),

            /// *** header item **** ////
            Container(
              margin: EdgeInsets.all(11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Rendez-vous',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    'Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: appoitmentdata.getappoitment(),
                builder: (context, snapshot) {
                  List<Appoitment> appotment = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: appotment.length,
                      itemBuilder: (context, index) => AppoitmentItem(
                        appotment[index].date,
                        appotment[index].doctor,
                        appotment[index].id,
                        appotment[index].isaccepted,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Text('no appitment trouved');
                  }
                },
              ),
            ),
          ],
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
