import 'package:flutter/material.dart';

import '../model/result.dart';

class DisplayResultScreen extends StatefulWidget {
  const DisplayResultScreen({ Key? key }) : super(key: key);

  @override
  State<DisplayResultScreen> createState() => _DisplayResultScreenState();
}

class _DisplayResultScreenState extends State<DisplayResultScreen> {
  List<String> batch = [
    '28-A',
    '28-B',
    '28-C',
  ];

  List<Result> newResult = [];


  String? dropdownValue;

    _makeNewList(List<Result> lstResult) {
    setState(() {
      newResult.clear();
      newResult.addAll(lstResult);
      newResult.retainWhere((result) => result.batch! == dropdownValue);
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Result> lstResult = 
      ModalRoute.of(context)!.settings.arguments as List<Result>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("View Results"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButtonFormField(
                hint: const Text("Choose batch"),
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
                    _makeNewList(lstResult);
                  });
                },
              ),
              
              DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Grade')),
                  DataColumn(label: Text('Percent')),
                  DataColumn(label: Text('Action')),
                ],
                rows: newResult.map(
                  (result) => DataRow(
                    selected: true,
                    cells: [
                      DataCell(
                        Text(result.name!),
                      ),
                      DataCell(
                        Text(result.grade()!),
                      ),
                      DataCell(
                        Text((result.percentage()).toStringAsFixed(2))
                      ),
                      
                      DataCell(
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(
                                    () {
                                      newResult.remove(result);
                                    },
                                  );
                                },
                              ),
                            ),
                    ]
                  )
                ).toList()
              ),
          ],
        ),
      ),
    );
  }
}