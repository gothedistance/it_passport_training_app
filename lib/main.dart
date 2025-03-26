import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/quiz/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizScreen());
  }
}
