import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerRight,
          child: const Text(
            'Hello',
            style: TextStyle(
              color: Color.fromARGB(255, 7, 193, 78),
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
