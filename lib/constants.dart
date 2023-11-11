import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color(0xFF62FCD7);
const kNotesBox = "notes box";

String addCurrentDataFormated() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(now);
  return formattedDate;
}

int findColorIndex(
  Color targetColor,
  List<Color> colorList,
) {
  for (int i = 0; i < colorList.length; i++) {
    if (colorList[i].value == targetColor.value) {
      return i;
    }
  }
  return -1; // Return -1 if the color is not found in the list
}

List<Color> kNoteColors = [
  Colors.blue,
  Colors.green,
  Colors.deepPurple,
  Colors.orange,
  Colors.redAccent,
  Colors.yellow,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.purple,
  Colors.amber,
];
