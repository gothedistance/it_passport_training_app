import 'package:flutter/material.dart';
import 'package:it_passport_training_app/data.dart';
import 'package:it_passport_training_app/feature/quiz/components/answer_button.dart';
import 'package:it_passport_training_app/feature/quiz/components/answer_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/choices_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/classification_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/description_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/question_number_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/question_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int selected = 0;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('ITパスポート2020', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 問題数
                QuestionNumberWidget(number: quizData.id),
                // 問題
                QuestionWidget(questionText: quizData.question),
                // 問題の選択肢
                ChoicesWidget(
                  choiceQuestions: quizData.choices,
                  onSelected: (answer) {
                    selected = answer;
                  },
                ),
                AnswerButton(
                  onPressed: () {
                    setState(() {
                      visible = true;
                    });
                  },
                ),
                //分類
                if (visible) ...[
                  ClassificationWidget(classification: quizData.classification),
                  //正解
                  AnswerWidget(answer: quizData.answer),
                  DescriptionWidget(description: quizData.descriptions),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
