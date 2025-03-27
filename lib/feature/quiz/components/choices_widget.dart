import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/core/quiz.dart';

class ChoicesWidget extends StatefulWidget {
  const ChoicesWidget({super.key, required this.choiceQuestions, required this.onSelected});

  // 選択問題を定義
  final List<ChoiceQuestions> choiceQuestions;
  final void Function(int answer) onSelected;

  @override
  State<ChoicesWidget> createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final (index, choiceQuestion) in widget.choiceQuestions.indexed)
            ListTile(
              leading: CircleAvatar(child: Text((index + 1).toString())),
              title: Text(choiceQuestion.value),
              onTap: () {
                setState(() {
                  selected = index + 1;
                  widget.onSelected(index);
                });
              },
              tileColor: selected == index + 1 ? Colors.grey.shade400 : null,
            ),
        ],
      ),
    );
  }
}
