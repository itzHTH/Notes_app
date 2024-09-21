import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/helper/show_success_toast.dart';
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
        return notesLits.isEmpty
            ? const Center(
                child: Text(
                  "You Don't Have Any Note \nAdd New note .",
                  style: TextStyle(fontSize: 20),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: notesLits.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                            dismissible: DismissiblePane(onDismissed: () {
                              DeleteNote(notesLits, index, context);
                            }),
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                backgroundColor: Colors.white.withOpacity(0.7),
                                label: "Delete",
                                icon: FontAwesomeIcons.deleteLeft,
                                onPressed: (context) {
                                  DeleteNote(notesLits, index, context);
                                },
                                borderRadius: BorderRadius.circular(8),
                                spacing: 0,
                              )
                            ]),
                        child: NotesItem(
                          note: notesLits[index],
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }

  void DeleteNote(List<NoteModel> notesLits, int index, BuildContext context) {
    notesLits[index].delete();
    BlocProvider.of<NotesCubit>(context).fetchNote();
    showSuccessToast(context);
  }
}
