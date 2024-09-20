import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditView.id, arguments: note);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(note.color)),
        child: Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    note.subtitle,
                    style: TextStyle(
                        fontSize: 16, color: Colors.black.withOpacity(.7)),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchNote();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 28,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Text(
                  note.date,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(.7)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
