
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      List<NoteModel> notesList = notesBox.values.toList();
      emit(NotesSuccess(notesList: notesList));
    } on Exception catch (e) {
      emit(NotesFailure(errMessage: e.toString()));
    }
  }
}
