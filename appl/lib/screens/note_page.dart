import 'package:flutter/material.dart';
import '../models/second_pages.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final List<String> _notes = [];

  @override
  Widget build(BuildContext context) {
    return SecondPageModels(
      title: 'Notes',
      content: Column(
        children: [
          Expanded(
            child: _notes.isEmpty
                ? Center(
              child: Text(
                'No notes available. Add a note using the button below.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            )
                : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: ListTile(
                    title: Text(
                      _notes[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit,
                              color: Colors.blue),
                          onPressed: () => _showNoteModal(
                            context,
                            editMode: true,
                            noteIndex: index,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _notes.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _showNoteModal(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Add Note',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showNoteModal(BuildContext context,
      {bool editMode = false, int? noteIndex}) {
    final TextEditingController _noteController = TextEditingController();
    if (editMode && noteIndex != null) {
      _noteController.text = _notes[noteIndex];
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_noteController.text.isNotEmpty) {
                    setState(() {
                      if (editMode && noteIndex != null) {
                        _notes[noteIndex] = _noteController.text;
                      } else {
                        _notes.add(_noteController.text);
                      }
                    });
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(editMode ? 'Save Changes' : 'Add Note'),
              ),
            ],
          ),
        );
      },
    );
  }
}
