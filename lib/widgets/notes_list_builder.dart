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
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AnimatedList(
            key: BlocProvider.of<NotesCubit>(context).key,
            padding: EdgeInsets.zero,
            initialItemCount: notesLits.length,
            itemBuilder: (context, index, animation) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SlideTransition(
                  position: animation.drive(Tween<Offset>(
                      begin: const Offset(1, 0), end: const Offset(0, 0))),
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                        dismissible: DismissiblePane(onDismissed: () {
                          deleteNote(notesLits, index, context);
                        }),
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            label: "Delete",
                            icon: FontAwesomeIcons.deleteLeft,
                            onPressed: (context) {
                              deleteNote(notesLits, index, context);
                            },
                            borderRadius: BorderRadius.circular(8),
                            spacing: 0,
                          )
                        ]),
                    child: NotesItem(
                      note: notesLits[index],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void deleteNote(List<NoteModel> notesLits, int index, BuildContext context) {
    NoteModel note = notesLits[index];
    notesLits[index].delete();

    BlocProvider.of<NotesCubit>(context).key.currentState!.removeItem(index,
        (context, animation) {
      return SizeTransition(
          sizeFactor: animation, child: NotesItem(note: note));
    });
    BlocProvider.of<NotesCubit>(context).fetchNote();
    showSuccessToast(context);
  }
}
