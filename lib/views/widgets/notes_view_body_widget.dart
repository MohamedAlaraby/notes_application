import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar_widget.dart';

import 'package:notes_app/views/widgets/notes_list_view.dart';

class NotesViewBodyWidget extends StatelessWidget {
  const NotesViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(title:"Notes",icon: Icons.search,),
          Expanded( child: NotesListView(),
           
          ),
        ],
      ),
    );
  }
}
