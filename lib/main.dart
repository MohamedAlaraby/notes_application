import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/Notes_view.dart';
import 'package:notes_app/views/edit_note_view.dart';

void main() async {
  await Hive.initFlutter();
  //the box is lik collection in firebase.
  await Hive.openBox(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NotesView.id: (context) => const NotesView(),
        EditNoteView.id: (context) => const EditNoteView(),
      },
      initialRoute: NotesView.id,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "poppins",
      ),
    );
  }
}
