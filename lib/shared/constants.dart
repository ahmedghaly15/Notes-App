import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kPrimaryColor = Colors.amber;

const String kNotesBox = 'notes_box';

String getDate() {
  DateTime dateTime = DateTime.now();
  String date = DateFormat.yMMMd().format(dateTime);
  return date;
}
