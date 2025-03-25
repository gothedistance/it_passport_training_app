import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.descriptions, required this.choice_questions});

  // 解説を定義
  final List<Map<String, String>> descriptions;

  // 解説を定義
  final List<Map<String, String>> choice_questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          alignment: Alignment.centerLeft,
          child: Text('▪️解説', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.2),
              border: Border.all(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var description in descriptions) ...[
                  if (description['summary'] != null) Text(description['summary'].toString()),
                  Row(
                    children: [
                      if (description['key'] != null)
                        Text(
                          description['key'].toString(),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      SizedBox(width: 10),
                      for (var choice_question in choice_questions)
                        if (choice_question['key'] == description['key'])
                          Expanded(
                            child: Text(
                              choice_question['value'].toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                    ],
                  ),
                  SizedBox(height: 5),
                  if (description['kaisetu'] != null) Text(description['kaisetu'].toString()),
                  SizedBox(height: 5),
                  const Divider(thickness: 1),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
