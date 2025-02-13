import 'package:flutter/material.dart';

import 'package:flutter_training/Task_3_Login_Page.dart';
import 'package:flutter_training/features/Login/Final_Task_Login.dart';
import 'package:flutter_training/task_1.dart';
import 'package:flutter_training/task_2.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();



  // await Supabase.initialize(
  //   url: "https://fkmebjqhdbhikbqsxocy.supabase.co",
  //   anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZrbWVianFoZGJoaWticXN4b2N5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkxMjk0MjYsImV4cCI6MjA1NDcwNTQyNn0.NOYmCVuruxrx_Nogw6o9LThIx7gFCmij3E-Y5vgHXQY" ,
  // );

  runApp(TrainingApp());
}

class TrainingApp extends StatelessWidget {
  const TrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinalTaskLogin(),


    );
  }
}

