import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/add_note_colors_listview.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';



class CustomAddNewNoteForm extends StatefulWidget {
  const CustomAddNewNoteForm({
    super.key,
  });
  @override
  State<CustomAddNewNoteForm> createState() => _CustomAddNewNoteFormState();
}

class _CustomAddNewNoteFormState extends State<CustomAddNewNoteForm> {
  var autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AddNoteCubit>(context);

    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          print("failed with message ${state.errorMessage}");
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<GetNotesCubit>(context).getNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          //To disable all the children.
          absorbing: state is AddNoteLoading,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              //SingleChildScrollView take space only to fit the contents.
              child: Form(
                key: formKey,
                autovalidateMode: autoValidateMode,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      onSaved: (text) {
                        title = text;
                      },
                      hintText: "Title",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      onSaved: (text) {
                        subTitle = text;
                      },
                      hintText: "Description",
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const ColorsList(),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        isLoading: state is AddNoteLoading,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            //To call the on save function.
                            formKey.currentState!.save();

                            var note = NoteModel(
                              title: title!,
                              subTitle: subTitle!,
                              date: addCurrentDataFormated(),
                            );
                            cubit.addNote(note);
                          } else {
                            //To validate on the data while the user is writting(real time validation).
                            autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
