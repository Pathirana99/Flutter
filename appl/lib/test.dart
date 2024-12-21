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
    'Income',
    'Foods',
    'Transport',
    'Medicine',
    'Entertainment',
    'Savings',
  ];

  // Controllers for each row
  final Map<int, TextEditingController> controllers = {};
  double balance = 0.0;

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

  // Method to calculate the balance
  void _calculateBalance() {
    double total = 0.0;

    // Loop through each category and calculate balance
    controllers.forEach((key, controller) {
      double amount = double.tryParse(controller.text) ?? 0.0;

      // If it's "Income", add to balance, else subtract
      if (categories[key] == 'Income') {
        total += amount;
      } else {
        total -= amount;
      }
    });

    setState(() {
      balance = total;
    });
  }

  // Method to handle "Add" button
  void _addTransaction() {
    // This is where you'd handle the "Add" button logic if needed
    _calculateBalance();
  }

  @override
  Widget build(BuildContext context) {
    return SecondPageModels(
      title: 'MoneY',
      content: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Column(
              children: [
                // Display the current balance
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Balance: \$${balance.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                // ListView for categories
                Expanded(
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
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: SizedBox(
                                  width: 100,
                                  child: TextField(
                                    controller: controllers[index],
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (value) {
                                      _calculateBalance();
                                    },
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
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTransaction,
          backgroundColor: Colors.blue.shade800,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
