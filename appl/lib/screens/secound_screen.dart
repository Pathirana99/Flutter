import 'package:appl/screens/home_page.dart';
import 'package:flutter/material.dart';


class SecoundScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02FFF7),
        title: Text('secound Screen'),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context,HomePage(title: ''));
            },
            icon: Icon(Icons.home)
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'secound Screen',
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
