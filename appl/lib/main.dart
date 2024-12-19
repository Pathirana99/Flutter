import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> rowData = [
    {'icon': Icons.account_balance, 'text': 'Bank Account'},
    {'icon': Icons.shopping_cart, 'text': 'Shopping'},
    {'icon': Icons.fastfood, 'text': 'Dining'},
    {'icon': Icons.directions_car, 'text': 'Transport'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter data based on the search query
    final filteredData = rowData
        .where((item) =>
        item['text']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(
            child: Text(
              'MoneY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 335,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.purple.shade800,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: InputBorder.none, // Removes the default border
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20, // Adjust the vertical padding
                      horizontal: 16, // Adjust horizontal padding
                    ),
                  ),
                  style: const TextStyle(color: Colors.white), // Adjust text color
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade800,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            filteredData[index]['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            filteredData[index]['text'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
