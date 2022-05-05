import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Dashboard(),
    ),
  );
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Dashboard"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 196, 53),
      ),
      backgroundColor: Colors.amber[50],
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.blue,
            child: TextFormField(
              // onChanged: (value) {
              //   setState(() {
              //     fname = value;
              //   });
              // },
              decoration: const InputDecoration(
                labelText: '',
                hintText: 'Enter numbers',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
