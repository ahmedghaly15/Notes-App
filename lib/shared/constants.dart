import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kPrimaryColor = Color(0xffFF958C);

List<Color> kColors = [
  kPrimaryColor,
  const Color(0xff883677),
  const Color(0xffCA61C3),
  const Color(0xffEE85B5),
  const Color(0xff441151),
];

const String kNotesBox = 'notes_box';

String getDate() {
  DateTime dateTime = DateTime.now();
  String date = DateFormat.MMMd().format(dateTime);
  return date;
}
