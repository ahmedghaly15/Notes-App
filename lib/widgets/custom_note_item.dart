import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditeNoteView()),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ListTile(
                title: const Text(
                  "FLutter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Learn Flutter",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Text(
                  "April, 18 2023",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
