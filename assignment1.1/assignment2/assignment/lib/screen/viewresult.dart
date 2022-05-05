
import 'package:assignment/model/student.dart';
import 'package:flutter/material.dart';

class ViewResultPage extends StatefulWidget {
  const ViewResultPage({Key? key}) : super(key: key);

  @override
  State<ViewResultPage> createState() => _ViewResultPageState();
}

class _ViewResultPageState extends State<ViewResultPage> {
  String? dropdownValue;
  List<Student> newStudents = [];

  List<String> batch = ["28A", "28B", "29A", "29B", "26A", "26B"];

  double? percentage;
  int totalMarks = 300;

  double _calculatePercentage(Student student) {
    setState(() {
      int obtainedMarks = int.parse(student.andriod!) +
          int.parse(student.api!) +
          int.parse(student.oop!);
      percentage = (obtainedMarks / totalMarks) * 100;
    });
    return double.parse(percentage!.toStringAsFixed(2));
  }

  bool _calculateResult(Student student) {
    if (int.parse(student.api!) > 40 &&
        int.parse(student.andriod!) > 40 &&
        int.parse(student.oop!) > 40) {
      return true;
    }
    return false;
  }

  _makeNewList(List<Student> lstStudent) {
    setState(() {
      newStudents.clear();
      newStudents.addAll(lstStudent);
      newStudents.retainWhere((student) => student.batch! == dropdownValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Student> lstStudent =
        ModalRoute.of(context)!.settings.arguments as List<Student>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField(
                  hint: const Text("Select your batch"),
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  // value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: batch.map<DropdownMenuItem<String>>((String batch) {
                    return DropdownMenuItem<String>(
                      value: batch,
                      child: Text(batch),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () {
                      _makeNewList(lstStudent);
                    },
                    child: const Text("View Students")),
                DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text("fname")),
                    // DataColumn(label: Text("batch")),
                    DataColumn(label: Text("Result")),
                    DataColumn(label: Text("Percentage")),
                    DataColumn(label: Text("Action"))
                  ],
                  rows: newStudents
                      .map(
                        (student) => DataRow(cells: [
                          DataCell(
                            Text(student.name!),
                          ),
                          // DataCell(
                          //   Text(student.batch!),
                          // ),
                          DataCell(
                            _calculateResult(student)
                                ? const Text("Pass")
                                : const Text("Fail"),
                          ),
                          DataCell(
                            Text(
                              _calculatePercentage(student).toString(),
                            ),
                          ),
                          DataCell(IconButton(
                            onPressed: () {
                              setState(() {
                                newStudents.remove(student);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          )),
                        ]),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
