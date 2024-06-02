import 'package:flutter/material.dart';
//import 'package:uuid/uuid.dart';

//const uuid = Uuid();

class MealCategory {
  final String id;
  final String title;
  final Color color;

  const MealCategory(
      {required this.id, required this.title, this.color = Colors.orange});
  //: id = uuid.v4();
}
