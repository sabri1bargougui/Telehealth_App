import 'package:TELEMEDICINEAPP/Presentation/Widgets/MyDrawer.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:TELEMEDICINEAPP/Services/appoitment/appoitment.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppoitmentScreen extends StatefulWidget {
  AppoitmentScreen({Key key}) : super(key: key);

  @override
  _AppoitmentScreenState createState() => _AppoitmentScreenState();
}

GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();

DateTime selectedDate = DateTime.now();
/*List<String> _doctors = ['Sabri Bargougui', 'Aziz Chayeb']; // Option 2
String _selectedDoctor; // Option 2 */

class _AppoitmentScreenState extends State<AppoitmentScreen> {
  TextEditingController dateCtl = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  bool _isloading = false;

  final AppoitmentData appoitmentdata = new AppoitmentData();
  String _doctor;
  @override
  void initState() {
    super.initState();
    _doctor = '';
    _isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'Rendez-vous',
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
      drawer: MyDrawerScreen(selected: 'AppoitmentScreen'),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: height * 0.45,
                width: width,
                child: Image.asset(
                  './assets/other/appoitment.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Prendre un rendez-vous',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // ***** Form  *** ///
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Form(
                    key: _formKeyy,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _name,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'Entrez votre Prénom!',
                            labelText: 'Prénom :',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'S\'il vous plaît entrez votre nom!';
                            }
                            return null;
                          },
                          //  onSaved: (value) => _name = value,
                        ),

                        SizedBox(height: 15),

                        /// **** Last Name *** //////

                        TextFormField(
                          controller: _lastname,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'Entrez votre nom',
                            labelText: 'Nom :',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'S\'il vous plaît entrez votre nom';
                            }
                            return null;
                          },
                          //onSaved: (value) => _lastname = value,
                        ),

                        SizedBox(height: 15),

                        /// *** phone number ** ////

                        TextFormField(
                          controller: _phonenumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Phone:",
                            hintText: "Entrez votre nom",
                            suffixIcon: Icon(Icons.phone, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'S\'il vous plaît entrez votre nom !';
                            } else if (value.length != 8) {
                              return 'S\'il vous plaît entrez valide nom';
                            } else
                              return null;
                          },
                          // onSaved: (value) => _phone = value,
                        ),

                        SizedBox(height: 15),

                        /// **** Date *** ////

                        TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            suffixIcon:
                                Icon(Icons.calendar_today, color: Colors.black),
                            labelText: "Date ",
                            hintText: "Entrer une Date",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                              helpText: 'Sélectionnez la date de rendez-vous',
                            );
                            dateCtl.text = date.year.toString() +
                                ' / ' +
                                date.day.toString() +
                                ' / ' +
                                date.month.toString();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' Must choise a date !';
                            }
                            return null;
                          },
                          // onSaved: (value) => _date = value,
                        ),

                        SizedBox(height: 15),
                        FindDropdown(
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          searchBoxDecoration: InputDecoration(
                            hintText: "Recherche",
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            "Ahmed Gammoudi",
                            "Sabri Bargougui",
                            "Iheb Bouazizi",
                            "Mohamed Amine  Aloui",
                          ],
                          label: "Médecins",
                          onChanged: (String item) {
                            setState(() {
                              _doctor = item;
                            });
                          },
                          selectedItem: "Choisissez un Médecins ",
                          validate: (String item) {
                            if (item == null)
                              return "Required field";
                            else if (item.isEmpty)
                              return "Invalid item";
                            else
                              return null; //return null to "no error"
                          },
                        ),

                        SizedBox(height: 15),

                        //// **** submit button **** ////
                        _isloading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : FlatButton(
                                color: Colors.red[200],
                                child: Text('Submit'),
                                height: 40,
                                onPressed: () async {
                                  if (_formKeyy.currentState.validate()) {
                                    final name = _name.text;
                                    final lastname = _lastname.text;
                                    final phonenumber = _phonenumber.text;
                                    final date = dateCtl.text;
                                    final doctor = _doctor;
                                    setState(() {
                                      _isloading = true;
                                    });

                                    await appoitmentdata
                                        .makeappoitment(name, lastname,
                                            phonenumber, doctor, date)
                                        .whenComplete(
                                      () {
                                        if (appoitmentdata.status) {
                                        } else {
                                          dispatchtohystoricanalysscreen();
                                          Scaffold.of(context).showSnackBar(
                                            new SnackBar(
                                              content: new Text(
                                                  'Rendez-vous enregistré!'),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
                              ),
                        SizedBox(height: 15),

                        // ******* end submit butto ******** ///
                      ],
                    ),
                  ),
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

  void dispatchtohystoricanalysscreen() {
    BlocProvider.of<NavigationBloc>(context).dispatch(
      GoToAppoitmentHistoricalEvent(),
    );
  }
}
