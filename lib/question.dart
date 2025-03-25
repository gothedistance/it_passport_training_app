import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key, required this.questionText});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 50), child: Text(questionText));
  }
}
