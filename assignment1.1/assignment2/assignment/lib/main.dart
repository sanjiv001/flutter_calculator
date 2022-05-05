
import 'package:assignment/screen/addresult.dart';
import 'package:assignment/screen/viewresult.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AddResultPage(),
        '/viewResult': (context) => const ViewResultPage()
      },
    ),
  );
}
