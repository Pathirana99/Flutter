import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './screens/budget_page.dart';
import './screens/summery_page.dart';
import './screens/calender_page.dart';
import './screens/note_page.dart';
import './models/second_pages.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
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
      'icon': Icons.monetization_on_rounded,
      'text': 'Manage Your Money',
      'iconColor': Color(0xFF00FF00),
      'textColor': Color(0xFF00FF00),
    },
    {
      'icon': Icons.summarize_outlined,
      'text': 'Summery',
      'iconColor': Color(0xFFF89757),
      'textColor': Color(0xFFF89757),
    },
    {
      'icon': Icons.calendar_today,
      'text': 'Calender',
      'iconColor': Color(0xFFFF0DB2),
      'textColor': Color(0xFFFF0DB2),
    },
    {
      'icon': Icons.note_alt_outlined,
      'text': 'Notes',
      'iconColor': Color(0xFF00FFF8),
      'textColor': Color(0xFF00FFF8),
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
            colors: [Colors.blue,Colors.white70, Colors.blue],
            begin: Alignment.bottomCenter, // Gradient starts from the bottom
            end: Alignment.topCenter, // Gradient ends at the top
            stops: [0, 0.73,0.76], // Adjust stop points to control the gradient's appearance
          )

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
                  border: Border.all(
                    color: Colors.white,  // Border color
                    width: 1.0,           // Border width
                  ),
                ),

                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search your day...',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                        color: Colors.blue.shade800,
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
                    child: InkWell(
                      onTap: () {
                        final String text = filteredData[index]['text'];
                        if (text == 'Manage Your Money') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Budget(),
                            ),
                          );
                        } else if (text == 'Summery') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Summery(),
                            ),
                          );
                        } else if (text == 'Calender') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Calender(),
                            ),
                          );
                        } else if (text == 'Notes') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Note(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
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
                                color: filteredData[index]['textColor'],
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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
