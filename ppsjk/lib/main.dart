import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
        appBar: AppBar(
          title: Text("SUNITH"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Text("WELLCOME TO Bdoor",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}