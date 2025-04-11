import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/core/quiz.dart';

class ChoicesWidget extends StatelessWidget {
  const ChoicesWidget({
    super.key,
    required this.choiceQuestions,
    required this.onSelected,
    required this.selected,
  });

  // 選択問題を定義
  final List<Choices> choiceQuestions;
  final void Function(String answer) onSelected;
  final String selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final choiceQuestion in choiceQuestions)
            ListTile(
              leading: CircleAvatar(child: Text(choiceQuestion.key)),
              title: Text(choiceQuestion.value),
              onTap: () {
                onSelected(choiceQuestion.key);
              },
              tileColor: selected == choiceQuestion.key ? Colors.grey.shade400 : null,
            ),
        ],
      ),
    );
  }
}
