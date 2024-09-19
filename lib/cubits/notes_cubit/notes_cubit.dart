import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notesList;
  fetchNote() async {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
  notesList = notesBox.values.toList();
  }
}
