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

  Widget _buildNameField(){
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(hintText: 'enter name'),
      validator: (text){
          return HelpValidate.nameValidate(text!);
         },
        onSaved: (text) {
      name = text!;
    },
    );
  }
  Widget _buildAdressField(){
    return  TextFormField(
      maxLength: 100,
      maxLines: 2,
      decoration: InputDecoration(hintText: 'enter address'),
      validator: (text){
        if(_formKey.currentState!.validate()){
          _formKey.currentState!.save();
          return(address);
        }
      },
      onSaved: (text){
        address = text!;
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
            margin: const EdgeInsets.all(24.0),
            child: Column(
                children: [
                  _buildNameField(),
                  _buildAdressField(),
                  SizedBox(height: 50,),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            print(name);
                          }
                        },
                        child: Text(
                          'submit',
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
class HelpValidate{
  static String? nameValidate(String value){
    if(value.isEmpty){
      return "cannot empty";
    }
    if(value.length < 20){
      return "at least 2 charecters";
    }
    if(value.length > 50){
      return "at most 50 charecters";
    }
    return null;
  }
}