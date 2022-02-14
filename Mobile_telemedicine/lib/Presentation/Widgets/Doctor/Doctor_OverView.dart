import 'package:TELEMEDICINEAPP/Presentation/Screens/Doctor/Doctor_Details_Screen.dart';
import 'package:flutter/material.dart';

class DoctorsItem extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String age;
  final String specialization;

  DoctorsItem(this.id, this.name, this.imageUrl, this.description, this.age,
      this.specialization);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorsDetailsScreen(
                    name, description, imageUrl, age, specialization),
              ),
            );
          },
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
