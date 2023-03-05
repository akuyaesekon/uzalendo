import 'package:flutter/material.dart';

void main() => runApp(const CrimeReporter());

class CrimeReporter extends StatelessWidget {
  const CrimeReporter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crime Reporter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CrimeReportForm(),
    );
  }
}

class CrimeReportForm extends StatefulWidget {
  const CrimeReportForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrimeReportFormState createState() => _CrimeReportFormState();
}

class _CrimeReportFormState extends State<CrimeReportForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Crime'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'Enter a title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter a description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit the form
                    // ignore: unused_local_variable
                    final title = _titleController.text;
                    // ignore: unused_local_variable
                    final description = _descriptionController.text;

                    // ignore: todo
                    // TODO: Implement crime reporting logic here

                    // Reset form fields
                    _titleController.clear();
                    _descriptionController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Crime reported')),
                    );
                  }
                },
                child: const Text('Report Crime'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
RaisedButton({required Null Function() onPressed, required Text child}) {
}
