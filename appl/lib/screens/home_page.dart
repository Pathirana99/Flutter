
import 'package:appl/screens/secound_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02FFF7),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter Navigation',
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_){
                return SecoundScreen();
              }
              ));
          //Navigator.of(context).pushNamed('/secound');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}