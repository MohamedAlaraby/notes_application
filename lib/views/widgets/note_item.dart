import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  const NoteItem(this.noteModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          EditNoteView.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(noteModel.color),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                noteModel.title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(noteModel.subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withAlpha(450),
                  )),
              trailing: IconButton(
                onPressed: () {
                  BlocProvider.of<GetNotesCubit>(context)
                      .deleteNote(note: noteModel);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  noteModel.date,
                  style: TextStyle(
                    color: Colors.black.withAlpha(450),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
