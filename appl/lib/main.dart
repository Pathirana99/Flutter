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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  List<String> get items => List<String>.generate(100, (index) => 'Item $index');
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Hello wellcome to new',
                style: TextStyle(fontSize: 25.0),
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder: (context, index){
          return ListTile(
            title: Text(items[index]),
          );
          },
      ),
    );
  }
}
//sunith kaushalya