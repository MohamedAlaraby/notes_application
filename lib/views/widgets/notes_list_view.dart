import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/note_item.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => const NoteItem(),
    );
  }
}