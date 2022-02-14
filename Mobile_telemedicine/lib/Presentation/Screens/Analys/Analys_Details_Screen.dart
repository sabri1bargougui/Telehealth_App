import 'package:flutter/material.dart';

class AnalysDetailsScreen extends StatelessWidget {
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

  const AnalysDetailsScreen(
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Analyse',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 18),
                    //// ****analyses *** ///
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 18),
                          // **** Hospital name *** ///
                          Text(
                            'Ministére de la Santé',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('H SIDI BOUZID',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('BIOCHIMIE',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Dr.Limem Mohamed',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 18),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 17),
                                        child: Text(
                                            'Prescripteur:MEDICIN A L \'HOPII'),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'HOPITAL DE SIDI BOUZID',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                              // **** USER NAME  *** ///
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Color(0xff000000),
                                  width: 4,
                                )),
                                child: Column(
                                  children: [
                                    Text(
                                        "${name.toUpperCase()} ${lastname.toLowerCase()}", // user name
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        bottom: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text('Date de Naiss:'),
                                          SizedBox(width: 10),
                                          Text(datenais) // user birthday
                                        ],
                                      ),
                                    ),
                                    // ****Index number *** ///
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        bottom: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text('INDEX :'),
                                          Text(indexnum), // index number
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 18),
                              // **** order and demande number *** ///
                              Row(
                                children: [
                                  Text(
                                    'N°Demande :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(numdemande), // index number
                                ],
                              ),
                              SizedBox(height: 18),
                              Row(
                                children: [
                                  Text('N°D\'Order :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(numorder), // order number
                                ],
                              ),
                              SizedBox(height: 18),
                              Row(
                                children: [
                                  Text(
                                    'Prélevement du :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(dateprelv) // prelevment date
                                ],
                              ),
                              SizedBox(height: 18),

                              // **** analys val *** ///
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Color(0xff000000),
                                  width: 4,
                                )),
                                child: Row(
                                  children: [
                                    SizedBox(width: 150),
                                    Text(
                                      'VALEURS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      'VALEURS USUELLES',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 18),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 250),
                                    child: Text(
                                      'Prélévement de Sang',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(width: 15),
                                      Text(analysnameone), // analys type
                                      SizedBox(width: 150),
                                      Text(valone), // val of analys
                                      SizedBox(width: 100),
                                      Text(valuselone), // va usuel
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 250),
                                    child: Text(
                                      'Prélévement d\'Urine',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(width: 15),
                                      Text(analysnametwo), // name of analys
                                      SizedBox(width: 130),
                                      Text(valtwo), // val of analys
                                      SizedBox(width: 80),
                                      Text(valuseltwo), // val  usuel
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    //// *** analys end *** ////
                  ],
                ),
              ),
              SizedBox(height: 60),
              // **** download button *** ///
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "Télécharger",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
