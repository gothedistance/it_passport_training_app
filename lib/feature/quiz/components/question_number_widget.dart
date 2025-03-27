import 'package:flutter/material.dart';

class QuestionNumberWidget extends StatelessWidget {
  const QuestionNumberWidget({super.key, required this.number});

  /// 問題が何番目かをしめす
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      child: Text('問$number', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
