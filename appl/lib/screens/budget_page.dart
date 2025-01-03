import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/second_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  double bal = 0.0;

  final List<String> categories = [
    'Income',
    'Foods',
    'Transport',
    'Medicine',
    'Fun',
    'Savings',
  ];

  final Map<int, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    loadBal();
    for (int i = 0; i < categories.length; i++) {
      controllers[i] = TextEditingController();
    }
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SecondPageModels(
      title: 'MoneY',
      content: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                  child: Container(
                    height: screenHeight * 0.12,
                    decoration: BoxDecoration(
                      color: const Color(0x9846F1EC),
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Center(
                      child: Text(
                        'Balance: \Rs ${bal.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: const Color(0xFFE10505),
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: Container(
                          height: screenHeight * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius:
                            BorderRadius.circular(screenWidth * 0.04),
                          ),
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                categories[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                EdgeInsets.only(right: screenWidth * 0.02),
                                child: SizedBox(
                                  width: screenWidth * 0.3,
                                  child: TextField(
                                    controller: controllers[index],
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: const InputDecoration(
                                      hintText: 'Enter amount',
                                      hintStyle: TextStyle(
                                        color: Colors.white70,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.05,
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
          onPressed: _addButton,
          backgroundColor: Colors.blue.shade800,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void _addButton() {
    _calBal();
    _clearFields();
  }

  void _calBal() {
    double tot = bal;

    controllers.forEach((a, cont) {
      double enterAmounter = double.tryParse(cont.text) ?? 0.0;
      if (categories[a] == 'Income') {
        tot += enterAmounter;
      } else {
        tot -= enterAmounter;
      }
    });
    setState(() {
      bal = tot;
    });
    saveBal(tot);
  }

  void loadBal() async {
    final lastbal = await SharedPreferences.getInstance();
    setState(() {
      bal = lastbal.getDouble('bal') ?? 0.0;
    });
  }

  void saveBal(double bal) async {
    final last = await SharedPreferences.getInstance();
    last.setDouble('bal', bal);
  }

  void _clearFields() {
    controllers.forEach((_, controller) {
      controller.clear();
    });
  }
}
