import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '/shared/bloc_observer.dart';
import '/shared/constants.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/note_model.dart';
import 'views/notes_view/notes_view.dart';

void main() async {
  //============= Observing My Bloc =============
  Bloc.observer = MyBlocObserver();
  //============= Initializing Hive =============
  await Hive.initFlutter();
  //============= Registering NoteModel Adapter =============
  Hive.registerAdapter(NoteModelAdapter());
  //============= Opening Hive Box =============
  await Hive.openBox<NoteModel>(kNotesBox);
  //============= Running Notes App =============
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
