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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isVisible = false; // 分類、回答、解説表示フラグ

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
                // 問題数
                Number(number: dummyData['id'].toString()),

                // 問題
                Question(questionText: dummyData['question'].toString()),

                // 問題の選択肢
                Choices(
                  choiceQuestions: dummyData['choice_questions'] as List<Map<String, String>>,
                ),

                //分類
                if (_isVisible) ...[
                  Classification(classification: dummyData['classification'].toString()),
                ],

                //正解
                Answer(
                  answer: dummyData['answer'].toString(),
                  show_answer: () {
                    setState(() {
                      _isVisible = true;
                    });
                  },
                  answer_Visible: _isVisible,
                ),

                // 解説
                if (_isVisible) ...[
                  Description(
                    descriptions: dummyData['descriptions'] as List<Map<String, String>>,
                    choice_questions: dummyData['choice_questions'] as List<Map<String, String>>,
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
