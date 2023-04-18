import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'add_new_note_form.dart';

class AddNewNoteBottomSheet extends StatelessWidget {
  const AddNewNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AddNoteSuccessState) {
            Navigator.pop(context);
          }

          if (state is AddNoteErrorState) {
            print("Error happens: ${state.error}");
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: AddNewNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
