import 'package:appl/screens/secound_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bdoor",
      //home: SecoundScreen(),
      home: HomePage(title: 'Flutter navigation'),
    );
  }
}

