import 'package:equatable/equatable.dart';
import 'package:notes_app/models/api_models/note.dart';

enum NoteItemStatus { loading, success, error }

class NoteItemState extends Equatable {
  final Note note;
  final NoteItemStatus status;
  final String errorText;

  const NoteItemState(
      {required this.note, required this.status, required this.errorText});

  NoteItemState copyWith(
      Note? note, NoteItemStatus? status, String? errorText) {
    return NoteItemState(
        note: note ?? this.note,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText);
  }

  @override
  List<Object?> get props => [note, status, errorText];
}
