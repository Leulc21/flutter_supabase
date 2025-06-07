// ignore_for_file: prefer_const_constructors, avoid_print, duplicate_ignore, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Check extends StatelessWidget {
  const Check({super.key});

  void addNewNote(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Note'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Enter note here'),
            onSubmitted: (value) async {
              await saveNote(value);
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await saveNote(textController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> saveNote(String noteText) async {
    final supabase = Supabase.instance.client;

    if (noteText.isEmpty) return;

    final response = await supabase.from('notes').insert({'body': noteText});

    // ignore: prefer_typing_uninitialized_variables
    if (response.error != null) {
      // ignore: avoid_print
      print('Error saving note: ${response.error!.message}');
    } else {
      print('Note saved successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewNote(context),
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: Center(child: Text('Press + to add a note')),
    );
  }
}
