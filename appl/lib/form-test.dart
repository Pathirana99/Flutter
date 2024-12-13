import 'package:flutter/material.dart';

class FormTest extends StatefulWidget {
  const FormTest({super.key});

  @override
  State<FormTest> createState() => _FormTestState();
}

class _FormTestState extends State<FormTest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String name;

  Widget _buildNameField(){
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(hintText: 'Name'),
      maxLines: 1,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Cannot be empty';
        }
        return null;
      },
      onSaved: (text) {
        name = text!;
      },
    );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Form - Tutorial 14'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Associate the _formKey with the Form widget
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildNameField(),
                _buildNameField(),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        print(name);
                      }
                    },
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
