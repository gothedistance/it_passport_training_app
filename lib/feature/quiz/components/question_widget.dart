import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key, required this.questionText});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(questionText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
