import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import '../widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});
  static String id = "EditView";

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: EditViewBody(
        note: note,
      ),
    );
  }
}
