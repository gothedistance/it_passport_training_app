import 'package:flutter/material.dart';
import 'package:it_passport_training_app/answer.dart';
import 'package:it_passport_training_app/choices.dart';
import 'package:it_passport_training_app/classification.dart';
import 'package:it_passport_training_app/data.dart';
import 'package:it_passport_training_app/description.dart';
import 'package:it_passport_training_app/number.dart';
import 'package:it_passport_training_app/question.dart';
import 'package:it_passport_training_app/version.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Version(version: dummyData['version'].toString()),
          backgroundColor: Colors.orange,
          actions: [ElevatedButton(onPressed: () {}, child: Text('ログイン\nユーザ登録'))],
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            primary: true,

            child: Column(
              children: [
                const SizedBox(height: 10),
                Number(number: dummyData['id'].toString()), // 問題数を定義したクラス
                const SizedBox(height: 30),
                Question(questionText: dummyData['question'].toString()), // 問題を定義
                const SizedBox(height: 50),
                // 問題の選択肢を定義したクラス
                Choices(
                  choiceQuestions: dummyData['choice_questions'] as List<Map<String, String>>,
                ),
                SizedBox(height: 30),
                Classification(classification: dummyData['classification'].toString()), //分類を定義をクラス
                SizedBox(height: 30),
                Answer(answer: dummyData['answer'].toString()), //正解を定義したクラス
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('▪️解説', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                // 解説を定義したクラス
                Description(
                  descriptions: dummyData['descriptions'] as List<Map<String, String>>,
                  choice_questions: dummyData['choice_questions'] as List<Map<String, String>>,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
