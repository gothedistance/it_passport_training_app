import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/core/answer_history.dart';
import 'package:it_passport_training_app/feature/quiz/quiz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 最後に解いた問題番号を取得する関数
  Future<int> getLastQuizNo() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('history');
    // これは正解。回答履歴がない場合は常に1
    if (jsonString == null) return 1;

    // これも正解。問題なし。
    final List<dynamic> jsonData = jsonDecode(jsonString);
    final List<VersionHistory> versionHistory =
        jsonData.map((e) => VersionHistory.fromJson(e as Map<String, dynamic>)).toList();

    // ここが微妙な所。欲しいのはAnswerHistoryのnoの最大値
    // それを得るためにexpandして全バージョンの回答履歴を1つのリストしているが、複数のバージョンが有る場合、それを選択しないといけない。
    // 今はバージョン1個なんで、versionHistory.firstでも良いと思われる。
    final List<AnswerHistory> allHistory = versionHistory.expand((v) => v.history).toList();
    // 不要。isEmptyがtrueになるケースがあり得るはずがない。jsonStringがnot nullの時点で、historyは空ではない。
    if (allHistory.isEmpty) return 1;
    // ソートはするなとは言わないが、破壊的変更を伴う処理はなるべく書かない。
    allHistory.sort((a, b) => b.no.compareTo(a.no));
    // 今回答している次の問題のNoが必要なので、+1して返す。
    return allHistory.first.no + 1;
    // reduceを使うと1発で最大値を取得できる。
    // reduce は、リストの先頭から順番に2つずつ要素を比較して、1つの結果に落とし込むという処理をする
    // a と b を比べて、no が大きい方を次の比較対象に進めるという処理になります。
    // AnswerHistory lastAnswer = versionHistory.first.history.reduce((a, b) => a.no > b.no ? a : b);
    // return lastAnswer.no;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<int>(
        future: getLastQuizNo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final quizNo = snapshot.data!;
            return QuizScreen(quizNo);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
