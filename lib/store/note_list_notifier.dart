import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/api/notes_api_service.dart';
import 'package:notes_app/models/api_models/note.dart';
import 'package:notes_app/models/state_models/note_list.dart';

class NoteListNotifier extends StateNotifier<NoteListState> {
  NoteListNotifier()
      : super(const NoteListState(
            notes: <Note>[], errorText: "", status: NoteListStatus.loading));

  void getAllNotes() async {
    try {
      state = state.copyWith(null, "", NoteListStatus.loading);
      List<Note> notes = await NoteApiService.getAllNotes();
      state = state.copyWith(notes, "", NoteListStatus.success);
    } catch (e) {
      state = state.copyWith(null, e.toString(), NoteListStatus.error);
    }
  }
}
