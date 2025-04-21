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
  Future<int> getLastQuizNo(int targetVersion) async {
    final preft = await SharedPreferences.getInstance();
    final jsonString = preft.getString('history');

    if (jsonString == null) return 1;
    final List<dynamic> jsonData = jsonDecode(jsonString);

    final List<VersionHistory> versionHistory =
        jsonData.map((e) => VersionHistory.fromJson(e as Map<String, dynamic>)).toList();

    final VersionHistory allHistory = versionHistory.firstWhere(
      (v) => v.version == targetVersion,
      orElse: () => VersionHistory(version: targetVersion, history: []),
    );

    // historyが空なら1を返す
    if (allHistory.history.isEmpty) return 1;

    allHistory.history.sort((a, b) => b.no.compareTo(a.no));

    return allHistory.history.first.no + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<int>(
        future: getLastQuizNo(2021),
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
