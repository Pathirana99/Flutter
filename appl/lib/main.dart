import 'dart:async';
import 'dart:convert';
import 'package:appl/network_request.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './form.dart';
import 'package:http/http.dart' as http;
import 'models/Users.dart';
import 'screens/detail.dart';

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
      home: const Home(

      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700, // Background gradient color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "search your date",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Icon(Icons.search, color: Colors.white),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuButton(
            label: "Control your money",
            textColor: Colors.green,
            icon: Icons.money,
          ),
          MenuButton(
            label: "Summery",
            textColor: Colors.pink,
            icon: Icons.list,
          ),
          MenuButton(
            label: "Calender",
            textColor: Colors.black,
            icon: Icons.calendar_today,
          ),
          MenuButton(
            label: "Notes",
            textColor: Colors.yellow,
            icon: Icons.notes,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                Text(
                  "Bdoor",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "manage your money be happy",
                  style: TextStyle(color: Colors.white70),
                ),
                const Icon(Icons.sentiment_satisfied, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final IconData icon;

  const MenuButton({
    required this.label,
    required this.textColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade800,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(icon, color: textColor),
          title: Text(
            label,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}