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
    'Entertainment',
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
    return SecondPageModels(
      title: 'MoneY',
      content: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0x9846F1EC),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Balance: \Rs ${bal.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Color(0xFFE10505),                          fontSize: 24,
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
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
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
                                    decoration: const InputDecoration(
                                      hintText: 'Enter amount',
                                      hintStyle:
                                          TextStyle(color: Colors.white70),
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
  }

  void _calBal() {
    double tot = bal;
    
    controllers.forEach((a, cont){
      double enterAmounter = double.tryParse(cont.text) ?? 0.0;
      if (categories[a] == 'Income'){
        tot += enterAmounter;
      }else{
        tot -= enterAmounter;
      }
    });
    setState(() {
      bal = tot;
    });
    saveBal(tot);
  }

  void loadBal() async{
    final lastbal = await SharedPreferences.getInstance();
    setState(() {
      bal = lastbal.getDouble('bal')?? 0.0;
    });
  }

  void saveBal(double bal) async{
    final last = await SharedPreferences.getInstance();
    last.setDouble('bal', bal);
  }
}

