import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/components/note_details.dart';
import 'package:notes_app/models/api_models/note.dart';
import 'package:notes_app/models/state_models/note_item.dart';
import 'package:notes_app/store/note_item_notifier.dart';

final noteProvider =
    StateNotifierProvider<NoteItemNotifier, NoteItemState>((ref) {
  const initialNote = Note(content: "", id: "", title: "", priority: 0);
  const noteState = NoteItemState(
      note: initialNote, status: NoteItemStatus.loading, errorText: "");
  return NoteItemNotifier(noteState);
});

class NoteItemScreen extends HookConsumerWidget {
  const NoteItemScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() => ref.read(noteProvider.notifier).getNoteById(id));
      return () => {};
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
        actions: <Widget>[
          IconButton(
              onPressed: () => ref.read(noteProvider.notifier).getNoteById(id),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: const NoteItemComponent(),
    );
  }
}

class NoteItemComponent extends HookConsumerWidget {
  const NoteItemComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noteProvider);
    if (state.status == NoteItemStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.status == NoteItemStatus.error) {
      return Center(child: Text(state.errorText));
    }
    return Container(
      padding: const EdgeInsets.all(8),
      child: NoteItemDetails(note: state.note),
    );
  }
}
