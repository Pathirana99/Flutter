import 'package:flutter/material.dart';

class SecondPageModels extends StatefulWidget {
  final String title;
  final Widget content;

  const SecondPageModels({
    super.key,
    required this.title,
    required this.content,
  });

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
                  child: Text(
                    widget.title,
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
        body: Center(
          child: widget.content,
        ),
      ),
    );
  }
}
