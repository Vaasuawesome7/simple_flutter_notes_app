import 'package:flutter/material.dart';
import 'package:notes_app/models/api_models/note.dart';

class NoteItemDetails extends StatelessWidget {
  const NoteItemDetails({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
            child: Text(
              note.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
            child: Text(
              note.content,
              style: const TextStyle(fontSize: 40.0),
            ),
          )
        ],
      ),
    );
  }
}
