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
  final List<ChoiceQuestions> choiceQuestions;
  final void Function(int answer) onSelected;
<<<<<<< HEAD
  final int currentAnswer;

  @override
  State<ChoicesWidget> createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  int selected = 0;
=======
  final int selected;
>>>>>>> fabfe5d (次の問題に行く)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final (index, choiceQuestion) in choiceQuestions.indexed)
            ListTile(
              leading: CircleAvatar(child: Text((index + 1).toString())),
              title: Text(choiceQuestion.value),
              onTap: () {
                onSelected(index);
              },
              tileColor: selected == index + 1 ? Colors.grey.shade400 : null,
            ),
        ],
      ),
    );
  }
}
