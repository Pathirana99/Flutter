import 'package:flutter/material.dart';

class FormTest extends StatefulWidget {
  const FormTest({super.key});

  @override
  State<FormTest> createState() => _FormTestState();
}

class _FormTestState extends State<FormTest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Form - Tutorial 14'),
      ),
      body: SingleChildScrollView(
        key: _formKey,
        child: Form(
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
               TextFormField(
                 maxLength: 20,
                 decoration: InputDecoration(hintText: 'Name'),
                 maxLines: 1,
                 validator:(text){
                   if(text!.isEmpty){
                     return'can not empty';
                   }
                   return null;
                 },
                 onSaved: (text){
                   name = text!;
                 },
               ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){},
                    // onPressed: () {
                    //    if (_formKey.currentState!.validate()) {
                    //      _formKey.currentState!.save();
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('Name saved: $name')),
                    //     );
                    //   }
                    // },
                   // child: Text('Save'),
                    child: Text('Saved'),
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
