import 'package:flutter/material.dart';
import 'package:it_passport_training_app/data.dart';
import 'package:it_passport_training_app/feature/core/quiz.dart';
import 'package:it_passport_training_app/feature/quiz/components/answer_button.dart';
import 'package:it_passport_training_app/feature/quiz/components/answer_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/choices_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/description_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/question_number_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/question_widget.dart';
import 'package:it_passport_training_app/feature/quiz/result_table.dart';

class ReviewQuestionsPage extends StatefulWidget {
  final int no;

  const ReviewQuestionsPage({required this.no, super.key});

  @override
  State<ReviewQuestionsPage> createState() => _ReviewQuestionsPage();
}

class _ReviewQuestionsPage extends State<ReviewQuestionsPage> {
  // 選択した回答
  String selectAnswer = "";
  // 確定した回答
  String finalAnswer = "";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Quiz>(
      future: getQuizData(widget.no),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('読み込みエラー: ${snapshot.error}'));
        }

        if (snapshot.hasData) {
          final question = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    // 問題数
                    QuestionNumberWidget(number: question.id),
                    // 問題
                    QuestionWidget(questionText: question.question),
                    // 問題の選択肢
                    ChoicesWidget(
                      choiceQuestions: question.choices,
                      selected: selectAnswer,
                      onSelected:
                          (answer) => setState(() {
                            selectAnswer = answer;
                          }),
                    ),
                    AnswerButton(
                      onPressed:
                          selectAnswer.isNotEmpty && finalAnswer.isEmpty
                              ? () async {
                                setState(() {
                                  finalAnswer = selectAnswer;
                                  saveAnswer(
                                    question.id,
                                    question.correctAnswer,
                                    finalAnswer,
                                    2021,
                                  );
                                });
                                finalAnswer == question.correctAnswer
                                    ? showAnswerDialog(context, "正解！", "○", Colors.green)
                                    : showAnswerDialog(context, "残念‥", "×", Colors.red);
                              }
                              : null,
                    ),
                    //分類・正解・解説
                    if (finalAnswer.isNotEmpty) ...[
                      AnswerWidget(answer: question.correctAnswer),
                      DescriptionWidget(description: question.explanation),
                    ],
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
