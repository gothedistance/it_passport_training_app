import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/core/answer_history.dart';
import 'package:it_passport_training_app/feature/quiz/components/review_questions_page.dart';

class ReviewQuestions extends StatelessWidget {
  final List<AnswerHistory> answerHistory;

  const ReviewQuestions({required this.answerHistory, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('復習問題'), backgroundColor: Colors.orange),
      body: PageView.builder(
        itemCount: answerHistory.length,
        itemBuilder: (context, index) {
          final no = answerHistory[index].no;
          return ReviewQuestionsPage(no: no);
        },
      ),
    );
  }
}
