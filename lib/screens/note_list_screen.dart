import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/components/note_item.dart';
import 'package:notes_app/models/state_models/note_list.dart';
import 'package:notes_app/store/note_list_notifier.dart';

final noteListProvider = StateNotifierProvider<NoteListNotifier, NoteListState>(
    (ref) => NoteListNotifier());

class NoteListScreen extends HookConsumerWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Smart notes"),
          actions: <Widget>[
            IconButton(
                onPressed: () =>
                    ref.watch(noteListProvider.notifier).getAllNotes(),
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: const NotesListComponent(),
        ));
  }
}

class NotesListComponent extends HookConsumerWidget {
  const NotesListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noteListProvider);

    useEffect(() {
      Future.microtask(() => ref.read(noteListProvider.notifier).getAllNotes());
      return () => {};
    }, []);

    if (state.status == NoteListStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.status == NoteListStatus.error) {
      return Center(child: Text("Error occured!: ${state.errorText}"));
    } else {
      return ListView.builder(
          itemCount: state.notes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: NoteItem(note: state.notes[index]),
            );
          });
    }
  }
}
