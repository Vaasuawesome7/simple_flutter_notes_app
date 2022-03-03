import 'package:equatable/equatable.dart';
import 'package:notes_app/models/api_models/note.dart';

enum NoteListStatus { loading, error, success }

class NoteListState extends Equatable {
  final List<Note> notes;
  final String errorText;
  final NoteListStatus status;

  const NoteListState(
      {required this.notes, required this.errorText, required this.status});

  NoteListState copyWith(
      List<Note>? notes, String? errorText, NoteListStatus? status) {
    return NoteListState(
        notes: notes ?? this.notes,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [notes];
}
