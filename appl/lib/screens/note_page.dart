import 'package:flutter/material.dart';
import '../models/second_pages.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return SecondPageModels(
      title: 'Pg1',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'This is Page 1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.yellow, size: 30),
              SizedBox(width: 10),
              Text(
                'Centered Row - Pg1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}