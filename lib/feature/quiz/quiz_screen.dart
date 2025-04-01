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
  // 選択した回答
  int selectAnswer = 0;
  // 確定した回答
  int finalAnswer = 0;
<<<<<<< HEAD

  int current = 1;

  @override
  void initState() {
    super.initState();
  }
=======
>>>>>>> 70ca5d9 (ファイナルアンサーを用意して、正解・不正解にかかわらず回答OPEN)

  @override
  Widget build(BuildContext context) {
    final quizData = quizList[current - 1];

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
                  currentAnswer: quizData.answer,
                  onSelected:
                      (answer) => setState(() {
                        selectAnswer = answer + 1;
                      }),
                ),
                AnswerButton(
                  onPressed:
                      selectAnswer != 0 && finalAnswer == 0
                          ? () async {
                            setState(() {
                              finalAnswer = selectAnswer;
                            });
                            finalAnswer == quizData.answer
                                ? showAnswerDialog(context, "正解！", "○", Colors.green)
                                : showAnswerDialog(context, "残念‥", "×", Colors.red);
                          }
                          : null,
                ),
                //分類・正解・解説
                if (finalAnswer > 0) ...[
                  ClassificationWidget(classification: quizData.classification),
                  AnswerWidget(answer: quizData.answer),
                  DescriptionWidget(description: quizData.descriptions),
                ],
              ],
            ),
          ),
        ),
        floatingActionButton:
            finalAnswer > 0
                ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      current++;
                      selectAnswer = 0;
                      finalAnswer = 0;
                    });
                  },
                  child: const Icon(Icons.arrow_forward),
                )
                : null,
      ),
    );
  }
}
