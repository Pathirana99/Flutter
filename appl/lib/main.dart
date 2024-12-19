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
      title: 'Budget',
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
    {
      'icon': Icons.attach_money,
      'text': 'Manage Your Money',
      'iconColor': Colors.white,
      'textColor': Color(0xFF00FF00),
    },
    {
      'icon': Icons.monetization_on_outlined,
      'text': 'Manage Your Money',
      'iconColor': Color(0xFF00FF00),
      'textColor': Color(0xFFF89757),
    },
    {
      'icon': Icons.monetization_on_outlined,
      'text': 'Manage Your Money',
      'iconColor': Color(0xFFF89757),
      'textColor': Color(0xFFFF0DB2),
    },
    {
      'icon': Icons.monetization_on_outlined,
      'text': 'Manage Your Money',
      'iconColor': Color(0xFFFF0DB2),
      'textColor': Color(0xFF007BFF),
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
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
                color: Color(0xFFFFFFFF),
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
                width: 331,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border(bottom: BorderSide(color: Colors.white)),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search your day...',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length + 2,
                itemBuilder: (context, index) {
                  if (index == filteredData.length) {
                    return const SizedBox(height: 50);
                  } else if (index == filteredData.length + 1) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade800,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text(
                              'MoneY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '...Save Your Future...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.copyright,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
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
                            color: filteredData[index]['iconColor'],
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            filteredData[index]['text'],
                            style: TextStyle(
                              color: filteredData[index]['textColor'] ,
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
