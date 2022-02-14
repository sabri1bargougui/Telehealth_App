import 'package:TELEMEDICINEAPP/Models/doctor/doctor.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/Doctor/Doctor_OverView.dart';
import 'package:TELEMEDICINEAPP/Presentation/Widgets/MyDrawer.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorScreen extends StatefulWidget {
  DoctorScreen({Key key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final List<Doctor> loadedDoctors = [
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
    Doctor(
      id: 'd1',
      name: 'Ahmed Gammoudi',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan.',
      imageUrl: 'assets/doctor/doctorone.jpg',
      age: '28',
      specialization: 'Emergency doctor',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nos médecins',
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
        selected: 'Doctors',
      ),
      body: Container(
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
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedDoctors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (ctx, i) => DoctorsItem(
            loadedDoctors[i].id,
            loadedDoctors[i].name,
            loadedDoctors[i].imageUrl,
            loadedDoctors[i].description,
            loadedDoctors[i].age,
            loadedDoctors[i].specialization,
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
