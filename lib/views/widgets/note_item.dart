import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

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
          color: const Color(0xffffcc80),
        ),
        child: Column(
          children: [
            ListTile(
              title: const Text(
                "Flutter Tips",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              subtitle: Text("Develop your career with mohamed elaraby",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withAlpha(450),
                  )),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "11 of Nov,2023",
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
