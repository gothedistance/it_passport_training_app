import 'package:flutter/material.dart';

class Choices extends StatelessWidget {
  const Choices({super.key, required this.choiceQuestions});

  // 選択問題を定義
  final List<Map<String, String>> choiceQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2), border: Border.all()),
      child: Padding(
        padding: EdgeInsets.all(05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var choiceQuestion in choiceQuestions)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05)),
                    ),
                    onPressed: () {},
                    child: Text(
                      choiceQuestion['key'].toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        choiceQuestion['value'].toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
