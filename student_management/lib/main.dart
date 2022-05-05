import 'package:flutter/material.dart';
import 'package:student_management/screen/dispaly_student_screen.dart';
import 'package:student_management/screen/student_entry_screen.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StudentEntryScreen(),
        '/displayStudentScreen': (context) => 
        const DisplayStudentScreen(),
      },
    ),
  );
}

