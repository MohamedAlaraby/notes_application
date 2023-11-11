import 'package:flutter/material.dart';

import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAddNewNoteForm();
  }
}

class CustomAddNewNoteForm extends StatefulWidget {
  const CustomAddNewNoteForm({
    super.key,
  });

  @override
  State<CustomAddNewNoteForm> createState() => _CustomAddNewNoteFormState();
}

class _CustomAddNewNoteFormState extends State<CustomAddNewNoteForm> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              controller: titleController,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onSaved: (text) {
                subTitle = text;
              },
              hintText: "Description",
              controller: descController,
              maxLines: 5,
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    //To call the on save function.
                    formKey.currentState!.save();
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
    );
  }
}
