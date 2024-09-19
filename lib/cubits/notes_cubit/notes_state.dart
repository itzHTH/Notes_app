part of 'notes_cubit.dart';

abstract class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NoteModel> notesList;

  NotesSuccess({required this.notesList});

}

final class NotesFailure extends NotesState {
  final String errMessage;

  NotesFailure({required this.errMessage});
}
