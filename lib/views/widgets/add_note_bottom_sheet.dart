import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          hintText: "Title",
          controller: titleController,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          hintText: "Description",
          controller: descController,
          maxLines: 5,
        ),
      ],
    );
  }
}
