import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color(0xFF62FCD7);
const kNotesBox = "notes box";


String addCurrentDataFormated() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(now);
  return formattedDate;
}