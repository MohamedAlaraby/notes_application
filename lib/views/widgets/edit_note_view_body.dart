import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/add_note_colors_listview.dart';
import 'package:notes_app/views/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_colors_listview.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditNoteFormBody();
  }
}

class EditNoteFormBody extends StatefulWidget {
  const EditNoteFormBody({
    super.key,
  });

  @override
  State<EditNoteFormBody> createState() => _EditNoteFormBodyState();
}

class _EditNoteFormBodyState extends State<EditNoteFormBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as NoteModel;



    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
            onTap: () {
              note.title = title ?? note.title;
              note.subTitle = subTitle ?? note.subTitle;
              //To edit the note.
              note.save();
              Navigator.pop(context);
              BlocProvider.of<GetNotesCubit>(context).getNotes();
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          onChanged: (text) {
            title = text;
          },
          hintText: note.title,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          onChanged: (text) {
            subTitle = text;
          },
          hintText: note.subTitle,
          maxLines: 5,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: EditNoteColorsList(
            note: note,
          ),
        ),
      ],
    );
  }
}
