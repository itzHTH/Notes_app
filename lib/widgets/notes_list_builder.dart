import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/notes_item.dart';

class NotesListBuilder extends StatelessWidget {
  const NotesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notesLits =
            BlocProvider.of<NotesCubit>(context).notesList!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notesLits.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: NotesItem(
                  note: notesLits[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
