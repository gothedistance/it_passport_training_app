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
  int currentIndex = 0; // 現在の問題番号
  int selected = 0;
  int selectAnswer = 0;
  int correctAnswers = 0; // 正解数
  int totalAnswers = 0; // 回答数
  bool choiceVisible = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    // 現在の問題
    final quizData = quizList[currentIndex];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('ITパスポート2020', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 問題数 正答率
                Text(
                  correctAnswers == 0
                      ? "正解数 $correctAnswers / $totalAnswers 問中  正答率 0%"
                      : "正解数 $correctAnswers / $totalAnswers 問中  正答率 ${((correctAnswers / totalAnswers) * 100)}%",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
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
                        selected = answer;
                        choiceVisible = true;
                      }),
                ),
                // 回答ボタン
                AnswerButton(
                  onPressed:
                      // 回答選択時のフラグを識別
                      choiceVisible == true
                          ? () {
                            setState(() {
                              totalAnswers++; // 回答数カウント
                              visible = true;
                              selectAnswer = selected + 1;
                              if (selectAnswer == quizData.answer) {
                                correctAnswers++; // 正解数カウント
                                showAnswerDialog(context, "正解！", "○", Colors.green);
                              } else {
                                showAnswerDialog(context, "残念‥", "×", Colors.red);
                              }
                            });
                          }
                          : null,
                ),
                // 分類
                if (visible) ...[
                  ClassificationWidget(classification: quizData.classification),
                  // 正解
                  AnswerWidget(answer: quizData.answer),
                  DescriptionWidget(description: quizData.descriptions),
                  // 次の問題へ
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          if (currentIndex < quizList.length - 1) {
                            currentIndex++; // 次の問題へ進む
                            choiceVisible = false; // 回答ボタン非活性
                            visible = false; // 正解等を非表示
                            selected = 0;
                          } else {
                            // 全問終了
                            showAnswerDialog(context, "お疲れ様でした！", "✔", Colors.blue);
                          }
                        });
                      },
                      child: Padding(padding: const EdgeInsets.all(8.0), child: Text("次の問題へ")),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
