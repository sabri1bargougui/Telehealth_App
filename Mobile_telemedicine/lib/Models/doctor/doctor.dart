import 'package:flutter/foundation.dart';

class Doctor {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String age;
  final String specialization;

  Doctor({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.imageUrl,
    @required this.age,
    @required this.specialization,
  });
}
