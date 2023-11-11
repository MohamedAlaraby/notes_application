import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class EditNoteColorsList extends StatefulWidget {
  final NoteModel note;
  const EditNoteColorsList({
    required this.note,
    super.key,
  });

  @override
  State<EditNoteColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
 
    currentIndex = findColorIndex(Color(widget.note.color!),kNoteColors);
    print("currentIndex is $currentIndex");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: kNoteColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            //this modification on the note object will make affect because this object
            //is global for the current context,if we assumed that we are in a tree then
            // the current context is a child to the note object context .
            widget.note.color = kNoteColors[index].value;
            currentIndex = index;

            setState(() {});
          },
          child: ColorItem(
            color: kNoteColors[index],
            isActive: currentIndex == index,
          ),
        ),
      ),
    );
  }
}
