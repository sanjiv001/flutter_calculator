import 'package:flutter/material.dart';

import '../model/result.dart';


class ResultEntryScreen extends StatefulWidget {
  const ResultEntryScreen({Key? key}) : super(key: key);

  @override
  State<ResultEntryScreen> createState() => _ResultEntryScreenState();
}

class _ResultEntryScreenState extends State<ResultEntryScreen> {
  List<String> lstBatch = [
    '28-A',
    '28-B',
    '28-C',
  ];

  String? name, batch;
  int? oopmarks, androidmarks, apimarks;

  List<Result> lstStudent = [];

  _addResult (Result result) {
    setState(() {
      lstStudent.add(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student Result'),
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
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Full name',
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
              
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    oopmarks = int.tryParse(value);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'OOP Marks',
                  hintText: 'OOP Marks',
                ),
              ),

              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    androidmarks = int.tryParse(value);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Android Marks',
                  hintText: 'Android Marks',
                ),
              ),

              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    apimarks = int.tryParse(value);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Web API Marks',
                  hintText: 'Web API Marks',
                ),
              ),
              
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Result result = Result(
                    name: name,
                    batch: batch,
                    oopmarks: oopmarks,
                    androidmarks: androidmarks,
                    apimarks: apimarks,
                  );
                  _addResult(result);
                },
                child: const Text('Add Result'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/displayResultScreen',
                    arguments: lstStudent,
                  );
                },
                child: const Text('View Results'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
