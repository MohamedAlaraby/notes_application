import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return EditNoteFormBody();
  }
}

class EditNoteFormBody extends StatefulWidget {
  EditNoteFormBody({
    super.key,
  });

  @override
  State<EditNoteFormBody> createState() => _EditNoteFormBodyState();
}

class _EditNoteFormBodyState extends State<EditNoteFormBody> {

  final AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: CustomAppBar(
              title: "Edit Note",
              icon: Icons.check,
            ),
          ),
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
              subTitle=text;
            },
           
            hintText: "Description",
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
