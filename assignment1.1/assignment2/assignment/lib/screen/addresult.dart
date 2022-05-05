
import 'package:assignment/model/student.dart';
import 'package:flutter/material.dart';

class AddResultPage extends StatefulWidget {
  const AddResultPage({Key? key}) : super(key: key);

  @override
  State<AddResultPage> createState() => _AddResultPageState();
}

class _AddResultPageState extends State<AddResultPage> {
  final _globalKey = GlobalKey<FormState>();

  String? dropdownValue;
  var batch = ["28A", "28B", "29A", "29B", "26A", "26B"];

  final _nameTextEditingController = TextEditingController();
  final _oopTextEditingController = TextEditingController();
  final _apiTextEditingController = TextEditingController();
  final _androidTextEditingController = TextEditingController();

  List<Student> stdMarks = [];

  _addButton(Student student) {
    setState(() {
      stdMarks.add(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _globalKey,
            child: Column(children: [
              TextFormField(
                controller: _nameTextEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "The full name cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your Name",
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              DropdownButtonFormField(
                  hint: const Text("Select your batch"),
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // ["28A", "28B", "29A", "29B", "26A", "26B"];
                  items: batch.map((String batch) {
                    return DropdownMenuItem(
                      value: batch,
                      child: Text(batch),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  }),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _oopTextEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "The OOP marks cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "OOP Marks",
                  hintText: "Enter your OOP marks",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _androidTextEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "OOP marks cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Andriod marks",
                  hintText: "Enter Android marks",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _apiTextEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "API marks cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "API marks",
                  hintText: "Enter API marks",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              
              ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                      name: _nameTextEditingController.text,
                      batch: dropdownValue,
                      oop: _oopTextEditingController.text,
                      andriod: _androidTextEditingController.text,
                      api: _apiTextEditingController.text,
                    );
                    _addButton(student);
                  },
                  child: const Text("Save Result")),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewResult',
                        arguments: stdMarks);
                  },
                  child: const Text("View Result"))
            ]),
          ),
        ),
      ),
    );
  }
}
