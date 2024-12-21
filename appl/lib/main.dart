import 'package:flutter/material.dart';
import './screens/budget_page.dart';
import './screens/summery_page.dart';
import './screens/calender_page.dart';
import './screens/note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      'iconColor': const Color(0xFF00FF00),
      'textColor': const Color(0xFF00FF00),
    },
    {
      'icon': Icons.summarize_outlined,
      'text': 'Summery',
      'iconColor': const Color(0xFFF89757),
      'textColor': const Color(0xFFF89757),
    },
    {
      'icon': Icons.calendar_today,
      'text': 'Calender',
      'iconColor': const Color(0xFFFF0DB2),
      'textColor': const Color(0xFFFF0DB2),
    },
    {
      'icon': Icons.note_alt_outlined,
      'text': 'Notes',
      'iconColor': const Color(0xFF00FFF8),
      'textColor': const Color(0xFF00FFF8),
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Filter data for search
    final filteredData = rowData
        .where((item) =>
        item['text']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.white, Colors.blue],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 0.73, 0.76],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              'MoneY',
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: screenWidth * 0.08,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
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
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length + 2,
                itemBuilder: (context, index) {
                  if (index == filteredData.length) {
                    return SizedBox(height: screenHeight * 0.05);
                  } else if (index == filteredData.length + 1) {
                    return Container(
                      height: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.04),
                          topRight: Radius.circular(screenWidth * 0.04),
                        ),
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'MoneY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '...Save Your Future...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                          ),
                          const Center(
                            child: Icon(
                              Icons.copyright,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.02,
                    ),
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
                        height: screenHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              filteredData[index]['icon'],
                              color: filteredData[index]['iconColor'],
                              size: screenWidth * 0.08,
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Text(
                              filteredData[index]['text'],
                              style: TextStyle(
                                color: filteredData[index]['textColor'],
                                fontSize: screenWidth * 0.06,
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
