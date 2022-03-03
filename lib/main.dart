import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/screens/note_list_screen.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child: SmarterNotesApp()));
}

class SmarterNotesApp extends StatelessWidget {
  const SmarterNotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Smarter Notes",
      home: NoteListScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smarter Notes"),
      ),
      body: const Center(
        child: Text("Hello World!!!"),
      ),
    );
  }
}
