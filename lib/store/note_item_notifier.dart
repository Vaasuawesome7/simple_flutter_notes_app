import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/api/notes_api_service.dart';
import 'package:notes_app/models/state_models/note_item.dart';

class NoteItemNotifier extends StateNotifier<NoteItemState> {
  NoteItemNotifier(NoteItemState noteState) : super(noteState);

  void getNoteById(String id) async {
    try {
      state = state.copyWith(null, NoteItemStatus.loading, null);
      final note = await NoteApiService.getNoteById(id);
      state = state.copyWith(note, NoteItemStatus.success, "");
    } catch (e) {
      state = state.copyWith(null, NoteItemStatus.error, e.toString());
    }
  }
}
