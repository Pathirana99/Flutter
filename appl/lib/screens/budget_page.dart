import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for input formatters
import '../models/second_pages.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  final List<String> categories = [
    'Balance',
    'Foods',
    'Transport',
    'Medicine',
    'Entertainment',
    'Savings',
  ];

  // Controllers for each row
  final Map<int, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each row
    for (int i = 0; i < categories.length; i++) {
      controllers[i] = TextEditingController();
    }
  }

  @override
  void dispose() {
    // Dispose controllers when no longer needed
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SecondPageModels(
      title: 'MoneY',
      content: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade800,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        categories[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(), // Add Spacer to push the TextField to the right
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0), // Add margin to the right
                        child: SizedBox(
                          width: 100, // Set width of the TextField
                          child: TextField(
                            controller: controllers[index], // Use the controller for each row
                            keyboardType: TextInputType.number, // Numeric keyboard
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly, // Only digits
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter amount',
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
