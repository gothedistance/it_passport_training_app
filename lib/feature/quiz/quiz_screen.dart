import 'package:flutter/material.dart';
import 'package:it_passport_training_app/data.dart';
import 'package:it_passport_training_app/feature/quiz/components/answer_button.dart';
import 'package:it_passport_training_app/feature/quiz/components/answer_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/choices_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/description_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/question_number_widget.dart';
import 'package:it_passport_training_app/feature/quiz/components/question_widget.dart';
import 'package:it_passport_training_app/feature/quiz/result_table.dart';

class QuizScreen extends StatefulWidget {
  final int quizNo;
  const QuizScreen(this.quizNo, {super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  // 選択した回答
  String selectAnswer = "";
  // 確定した回答
  String finalAnswer = "";

  int current = 1;

  @override
  void initState() {
    super.initState();
    // 引数から初期値セット
    current = widget.quizNo;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('ITパスポート2020', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultTable()),
                );
              },
              icon: const Icon(Icons.history, color: Colors.black),
              iconSize: 30,
            ),
          ],
        ),
        body: FutureBuilder(
          future: getQuizData(current),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              final quizData = snapshot.data!;
              return SingleChildScrollView(
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
                                      quizData.id,
                                      quizData.correctAnswer,
                                      finalAnswer,
                                      2020,
                                    );
                                  });
                                  finalAnswer == quizData.correctAnswer
                                      ? showAnswerDialog(context, "正解！", "○", Colors.green)
                                      : showAnswerDialog(context, "残念‥", "×", Colors.red);
                                }
                                : null,
                      ),
                      //分類・正解・解説
                      if (finalAnswer.isNotEmpty) ...[
                        AnswerWidget(answer: quizData.correctAnswer),
                        DescriptionWidget(description: quizData.explanation),
                      ],
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton:
            finalAnswer.isNotEmpty
                ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      current++;
                      selectAnswer = "";
                      finalAnswer = "";
                    });
                  },
                  child: const Icon(Icons.arrow_forward),
                )
                : null,
      ),
    );
  }
}
