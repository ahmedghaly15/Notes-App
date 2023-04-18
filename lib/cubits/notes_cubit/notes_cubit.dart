import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';

import '../../models/note_model.dart';
import '../../shared/constants.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

  static NotesCubit getObject(context) => BlocProvider.of(context);

  void fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccessState(notes));
    } catch (e) {
      emit(NotesErrorState(e.toString()));
    }
  }
}
