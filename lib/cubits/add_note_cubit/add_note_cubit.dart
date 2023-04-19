import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '/cubits/add_note_cubit/add_note_states.dart';
import '/models/note_model.dart';
import '/shared/constants.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  //================= Get an object of the cubit =================
  static AddNoteCubit getObject(context) => BlocProvider.of(context);

  Color color = kPrimaryColor;

  //========= Add a new note =========
  void addNote({required NoteModel note}) {
    // Specify the color of the note while adding it
    note.color = color.value;
    emit(AddNoteLoadingState());
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notesBox.add(note).then((value) {
      emit(AddNoteSuccessState());
    }).catchError((error) {
      emit(AddNoteErrorState(error.toString()));
    });
  }
}
