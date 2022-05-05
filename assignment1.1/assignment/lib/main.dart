import 'package:assignment/screen/display_result_screen.dart';
import 'package:assignment/screen/result_entry_screen.dart';
import 'package:flutter/material.dart';


void main(){
    runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ResultEntryScreen(),
        '/displayResultScreen': (context) => const DisplayResultScreen(),
        
      },
    ),
  );
}