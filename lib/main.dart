import 'package:flutter/material.dart';
import 'screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayo Main Kuis',
      theme: ThemeData(
      ),
      home: QuizStartScreen(),
    );
  }
}