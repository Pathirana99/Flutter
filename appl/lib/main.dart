import 'dart:async';
import 'dart:convert';
import 'package:appl/network_request.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './form.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Home(title: 'Flutter Builder',),
    );
  }
}
class Home extends StatefulWidget {

  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future getUsers() async{
    var url = Uri.parse('https://randomuser.me/api/?results=20');
    late http.Response response;
    try{
      response = await http.get(url);
      if(response.statusCode == 200){
        Map peopleData = jsonDecode(response.body);
        List<dynamic> peoples = peopleData["results"];

        for(var item in peoples){
          var email = item['email'];
          var name = item['name']['first']+" "+ item['name']['last'];
          var id = item['login']['uuid'];
          var avatar = item['picture']['large'];
        }
      }else{
        return Future.error("Somthing went wrong, ${response.statusCode}");
      }
    }catch(e){
       return Future.error(e.toString());
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Asynchronous Programming"),
      ),
    );
  }
}