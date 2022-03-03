import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notes_app/models/api_models/note.dart';
import 'package:notes_app/utils/api_constants.dart';

class NoteApiService {
  static Future<List<Note>> getAllNotes() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.getAllNotes));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return getNotesFromJson(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  static Future<Note> getNoteById(String id) async {
    try {
      final response = await http.get(Uri.parse("${ApiConstants.getNote}$id"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        return Note.fromJson(data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
