import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_item.dart';

class NotesListBuilder extends StatelessWidget {
  const NotesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: NotesItem(),
          );
        },
      ),
    );
  }
}
