import 'package:TELEMEDICINEAPP/Models/Analys/analys.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/Analys/Analys_Over_View_Screen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/MyDrawer.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:TELEMEDICINEAPP/Services/analys/analys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysScreen extends StatefulWidget {
  AnalysScreen({Key key}) : super(key: key);

  @override
  _AnalysScreenState createState() => _AnalysScreenState();
}

class _AnalysScreenState extends State<AnalysScreen> {
  final AnalysData analysdata = new AnalysData();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'Analyses',
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
        selected: 'Analysis',
      ),
      body: Container(
          height: height,
          width: width,
          child: Container(
            child: FutureBuilder(
              future: analysdata.getanalys(),
              builder: (context, snapshot) {
                List<Analys> analys = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: analys.length,
                    itemBuilder: (context, index) => AnalysItem(
                      analys[index].numdemande,
                      analys[index].numdOrder,
                      analys[index].name,
                      analys[index].dateprelv,
                      analys[index].datenais,
                      analys[index].valone,
                      analys[index].valtwo,
                      analys[index].analysnameone,
                      analys[index].analysnametwo,
                      analys[index].valuselone,
                      analys[index].valuseltwo,
                      analys[index].indexnum,
                      analys[index].analysname,
                      analys[index].lastname,
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                } else {
                  return Text('no appitment trouved');
                }
              },
            ),
          )
          //// *** analys end *** ////

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
