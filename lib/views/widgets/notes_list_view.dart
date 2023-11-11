import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();

}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<GetNotesCubit, GetNotesState>(
      listener: (context, state) {},
      builder: (context, state) {
      var cubit = BlocProvider.of<GetNotesCubit>(context);
          return ListView.builder(
            itemCount: cubit.notes.length,
            itemBuilder: (context, index) => NoteItem(cubit.notes[index]),
          );
       
      },
    );
  }
}
