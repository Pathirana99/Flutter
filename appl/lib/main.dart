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
      routes: <String,WidgetBuilder>{
        '/secound': (context) => SecoundScreen()
      },
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bdoor"),
        backgroundColor: Color(0xFF02FFF7),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              maxLength: 4,
              onSubmitted: (tes){
                print(tes);
              },
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              autofocus: true,
              maxLength: 4,
              obscureText: true,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22.0),
              //enabled: false,
              cursorColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

