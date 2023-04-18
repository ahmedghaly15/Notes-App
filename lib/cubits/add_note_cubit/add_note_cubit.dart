import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/shared/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  static AddNoteCubit getObject(context) => BlocProvider.of(context);

  void addNote({required NoteModel note}) {
    emit(AddNoteLoadingState());
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notesBox.add(note).then((value) {
      emit(AddNoteSuccessState());
    }).catchError((error) {
      emit(AddNoteErrorState(error.toString()));
    });
  }
}
