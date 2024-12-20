import 'package:flutter/material.dart';

class SecondPageModels extends StatefulWidget {
  const SecondPageModels({super.key});

  @override
  State<SecondPageModels> createState() => _SecondPageModelsState();
}

class _SecondPageModelsState extends State<SecondPageModels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purple, Colors.deepPurple],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.01, 0.5, 1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Stack(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  // Adjust the left padding
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  // Adjust vertical alignment
                  child: Text(
                    'MoneY',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
