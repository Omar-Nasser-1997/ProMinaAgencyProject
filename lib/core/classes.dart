import 'package:flutter/material.dart';

class Data {
  Data({required this.day, required this.number, required this.ifSelected});
  String number;
  String day;
  bool ifSelected;
}

class DataTypeTwo {
  DataTypeTwo(
      {required this.title, required this.text, required this.time, this.icon});
  String title;
  String text;
  String time;
  Widget? icon;
}