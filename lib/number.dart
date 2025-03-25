import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  const Number({super.key, required this.number});

  //問題数を定義
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('問$number', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const Spacer(), //空きスペースを埋める
          IconButton(icon: const Icon(Icons.calculate_outlined), onPressed: () {}, iconSize: 35),
        ],
      ),
    );
  }
}
