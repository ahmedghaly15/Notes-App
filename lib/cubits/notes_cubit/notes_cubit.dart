import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '/cubits/notes_cubit/notes_states.dart';
import '/models/note_model.dart';
import '/shared/constants.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(GetNotesInitialState());

  //============== Get an object of the cubit ==============
  static NotesCubit getObject(context) => BlocProvider.of(context);

  List<NoteModel>? notes;

  //========== Getting all the notes ==========
  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(GetNotesSuccessState());
  }
}
