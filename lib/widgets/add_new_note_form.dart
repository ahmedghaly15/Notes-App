import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import '../shared/constants.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNewNoteForm extends StatefulWidget {
  const AddNewNoteForm({
    super.key,
  });

  @override
  State<AddNewNoteForm> createState() => _AddNewNoteFormState();
}

class _AddNewNoteFormState extends State<AddNewNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoadingState ? true : false,
                height: 8,
                width: 150,
                buttonText: "Add",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    NoteModel noteModel = NoteModel(
                      title: title,
                      subTitle: subTitle,
                      date: getDate(),
                      time: TimeOfDay.now().format(context),
                      color: Colors.blue.value,
                    );
                    AddNoteCubit.getObject(context).addNote(note: noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(
                      () {},
                    );
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
