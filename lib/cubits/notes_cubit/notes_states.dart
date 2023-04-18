import 'package:notes_app/models/note_model.dart';

abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesLoadingState extends NotesStates {}

class NotesSuccessState extends NotesStates {
  final List<NoteModel> notes;
  NotesSuccessState(this.notes);
}

class NotesErrorState extends NotesStates {
  final String error;
  NotesErrorState(this.error);
}
