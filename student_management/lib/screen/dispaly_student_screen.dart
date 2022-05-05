import 'package:flutter/material.dart';
import '../model/student.dart';

class DisplayStudentScreen extends StatefulWidget {
  const DisplayStudentScreen({Key? key}) : super(key: key);

  @override
  State<DisplayStudentScreen> createState() => _DisplayStudentScreenState();
}

class _DisplayStudentScreenState extends State<DisplayStudentScreen> {
  @override
  Widget build(BuildContext context) {
    //Receive values from NamedRoutes's arguments
    // List<Student> lstStudents =
    //     ModalRoute.of(context)!.settings.arguments as List<Student>;

    List<Student> lstStudents = [
      Student(fname: 'asd', lname: 'asd', batch: 'asd', email: 'asd'),
      Student(fname: 'asd', lname: 'asd', batch: 'asd', email: 'asd'),
      Student(fname: 'asd', lname: 'asd', batch: 'asd', email: 'asd'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Student'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('Fname'),
                ),
                DataColumn(
                  label: Text('Lname'),
                ),
                DataColumn(
                  label: Text('Batch'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: lstStudents
                  .map(
                    (student) => DataRow(
                      selected: true,
                      cells: [
                        DataCell(
                          Text(student.fname!),
                        ),
                        DataCell(
                          Text(student.lname!),
                        ),
                        DataCell(
                          Text(student.batch!),
                        ),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(
                                () {
                                  lstStudents.remove(student);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
