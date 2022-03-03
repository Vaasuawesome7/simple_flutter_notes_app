import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/models/api_models/note.dart';
import 'package:notes_app/screens/note_item_screen.dart';

class NoteItem extends ConsumerWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          isThreeLine: true,
          enableFeedback: true,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteItemScreen(id: note.id)));
          }),
    );
  }
}
