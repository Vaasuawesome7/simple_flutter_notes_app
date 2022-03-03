import 'dart:convert';

import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String id;
  final String title;
  final String content;
  final int priority;

  const Note(
      {required this.title,
      required this.content,
      required this.priority,
      required this.id});

  factory Note.fromJson(Map<String, dynamic> jsonData) {
    return Note(
      title: jsonData['title'],
      content: jsonData['content'],
      priority: jsonData['priority'],
      id: jsonData['_id'],
    );
  }

  @override
  List<Object?> get props => [id, title, content, priority];
}

List<Note> getNotesFromJson(String jsonArrayData) =>
    List<Note>.from(jsonDecode(jsonArrayData).map((x) => Note.fromJson(x)));
