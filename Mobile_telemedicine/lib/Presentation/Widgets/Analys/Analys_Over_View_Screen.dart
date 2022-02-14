import 'package:TELEMEDICINEAPP/Presentation/Screens/Analys/Analys_Details_Screen.dart';
import 'package:flutter/material.dart';

class AnalysItem extends StatelessWidget {
  final String numdemande;
  final String numorder;
  final String name;
  final String dateprelv;
  final String datenais;
  final String valone;
  final String valtwo;
  final String analysnameone;
  final String analysnametwo;
  final String valuselone;
  final String valuseltwo;
  final String indexnum;
  final String analysname;
  final String lastname;

  const AnalysItem(
      this.numdemande,
      this.numorder,
      this.name,
      this.dateprelv,
      this.datenais,
      this.valone,
      this.valtwo,
      this.analysnameone,
      this.analysnametwo,
      this.valuselone,
      this.valuseltwo,
      this.indexnum,
      this.analysname,
      this.lastname);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        color: Colors.white,
        child: ListTile(
          trailing: IconButton(
            icon: Icon(Icons.add_location), // view analys
            color: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnalysDetailsScreen(
                      numdemande,
                      numorder,
                      name,
                      dateprelv,
                      datenais,
                      valone,
                      valtwo,
                      analysnameone,
                      analysnametwo,
                      valuselone,
                      valuseltwo,
                      indexnum,
                      analysname,
                      lastname),
                ),
              );
            },
          ),
          title: Row(
            children: [
              Text(
                analysname, // analys name
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 15),
              Text(
                'DATE:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text(
                dateprelv, // analys date
              ),
            ],
          ),
        ),
      ),
    );
  }
}
