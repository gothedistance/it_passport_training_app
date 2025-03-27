import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/core/quiz.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.description});

  final AnswerDescription description;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description.summary),
                SizedBox(height: 10),
                Text('解答メモ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final (index, answer) in description.answers.indexed)
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('問${index + 1}'),
                              SizedBox(width: 10),
                              Flexible(child: Text(answer.kaisetu)),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
