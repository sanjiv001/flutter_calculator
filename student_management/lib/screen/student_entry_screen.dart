import 'package:flutter/material.dart';
import 'package:student_management/model/student.dart';


class StudentEntryScreen extends StatefulWidget {
  const StudentEntryScreen({Key? key}) : super(key: key);

  @override
  State<StudentEntryScreen> createState() => _StudentEntryScreenState();
}

class _StudentEntryScreenState extends State<StudentEntryScreen> {
  List<String> lstBatch = [
    '28-A',
    '28-B',
    '28-C',
  ];

  String? fname, lname, batch, email;
  List<Student> lstStudent = [];

  _addStudent(Student student) {
    setState(() {
      lstStudent.add(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registeration'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    fname = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    lname = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                ),
              ),
              const SizedBox(height: 8),
              Autocomplete<String>(
                onSelected: (option) => {
                  setState(() {
                    batch = option;
                  })
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return lstBatch
                      .where((batch) => batch.startsWith(textEditingValue.text))
                      .toList();
                },
              ),
              // TextFormField(
              //   onChanged: (value) {
              //     setState(() {
              //       batch = value;
              //     });
              //   },
              //   decoration: const InputDecoration(
              //     labelText: 'Batch',
              //     hintText: 'Enter your batch',
              //   ),
              // ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Student student = Student(
                    fname: fname,
                    lname: lname,
                    batch: batch,
                    email: email,
                  );
                  _addStudent(student);
                },
                child: const Text('Add Student'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/displayStudentScreen',
                    arguments: lstStudent,
                  );
                },
                child: const Text('View Students'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
