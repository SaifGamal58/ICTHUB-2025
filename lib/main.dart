import 'package:flutter/material.dart';
import 'package:flutter_training/Task_3_Login_Page.dart';
import 'package:flutter_training/task_1.dart';
import 'package:flutter_training/task_2.dart';




void main() {
  runApp(TrainingApp());
}

class TrainingApp extends StatelessWidget {
  const TrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),


    );
  }
}

