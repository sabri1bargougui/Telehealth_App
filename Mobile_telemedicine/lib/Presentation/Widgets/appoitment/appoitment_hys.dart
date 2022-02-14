import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:TELEMEDICINEAPP/Services/appoitment/appoitment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class AppoitmentItem extends StatelessWidget {
  final String doctor;
  final String date;
  final String id;
  final String isaccepted;
  AppoitmentItem(this.date, this.doctor, this.id, this.isaccepted);
  final AppoitmentData appoitmentdata = new AppoitmentData();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: new Text("Es-tu sûr?"),
            actions: <Widget>[
              FlatButton(
                child: Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ProgressButton(
                color: Colors.red,
                defaultWidget: Text('Supprimer'),
                progressWidget: const CircularProgressIndicator(),
                width: 70,
                height: 40,
                onPressed: () async {
                  await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                  await appoitmentdata.deleteappoitment(id).whenComplete(
                    () {
                      if (appoitmentdata.status) {
                        showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            title: new Text(
                              "oops,please try again..!",
                              style: TextStyle(color: Colors.red),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.of(context).pop();
                        Scaffold.of(context).showSnackBar(
                          new SnackBar(
                            duration: const Duration(seconds: 15),
                            content: new Text('Rendez-vous supprimé!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  );
                  return () {
                    BlocProvider.of<NavigationBloc>(context).dispatch(
                      GoToAppoitmentHistoricalEvent(),
                    );
                  };
                },
              ),
            ],
          ),
        );
      },
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFFFE6E6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Spacer(),
            Icon(Icons.delete),
          ],
        ),
      ),
      child: Card(
        color: Colors.greenAccent[50],
        child: ListTile(
          trailing: Text(isaccepted,
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          title: Row(
            children: [
              Text('Docteur:'),
              SizedBox(width: 70),
              Text(date),
            ],
          ),
          subtitle: Text(
            doctor,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
