import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String name;
  late String address;
  late int phoneNo;
  Widget _buildNameField() {
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(hintText: 'Enter name'),
      validator: (text) {
        return HelpValidate.nameValidate(text!);
      },
      onSaved: (text) {
        name = text!;
      },
    );
  }

  Widget _buildAdressField() {
    return TextFormField(
      maxLength: 100,
      maxLines: 2,
      decoration: InputDecoration(hintText: 'Enter address'),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Address cannot be empty';
        }
        if (text.length < 10) {
          return 'Address must be at least 10 characters';
        }
        return null;
      },
      onSaved: (text) {
        address = text!;
      },
    );
  }
  Widget _buildPhoneNoField() {
    return TextFormField(
      maxLength: 10,
      maxLines: 1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: 'Enter phone number'),
      onSaved: (text) {
        phoneNo = text! as int;
      },
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Cannot be empty';
        }
        if (text.length < 10) {
          return 'Not valid Number';
        }
        return null;
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
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildNameField(),
                _buildAdressField(),
                _buildPhoneNoField(),
                SizedBox(
                    height: 70,
                ),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("Name: $name");
                        print("Address: $address");
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20.0,
                      ),
                    ),
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

class HelpValidate {
  static String? nameValidate(String value) {
    if (value.isEmpty) {
      return "Cannot be empty";
    }
    if (value.length < 2) {
      return "At least 2 characters";
    }
    if (value.length > 50) {
      return "At most 50 characters";
    }
    return null;
  }
}
