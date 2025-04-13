import 'dart:convert'; // ← JSON操作に必要！

import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/core/answer_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultTable extends StatelessWidget {
  const ResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('成績一覧'), backgroundColor: Colors.orange),
      body: FutureBuilder(
        future: getAnswerHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final result = snapshot.data!;
            // 問題No.を昇順に設定
            result.sort((a, b) => a.no.compareTo(b.no));
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
                childAspectRatio: 1.5,
              ),
              itemCount: result.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 問題No.
                      Text(
                        "問${result[index].no}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      // 回答、正解、判定
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(text: 'あなたの答え：${result[index].correct}\n'),
                            TextSpan(text: '正解：${result[index].answer}\n'),
                            const TextSpan(text: '判定：'),
                            TextSpan(
                              text:
                                  result[index].answer == result[index].correct ? '○ 正解！' : '× 不正解',
                              style: TextStyle(
                                color:
                                    result[index].answer == result[index].correct
                                        ? Colors.green
                                        : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// 回答を保存する関数
Future<void> saveAnswer(int no, String answer, String correct) async {
  final prefs = await SharedPreferences.getInstance();
  const int version = 2020;

  // 既存の履歴を取得
  String? historyJson = prefs.getString('history');
  List<AnswerHistory> historyList = [];

  if (historyJson != null) {
    // JSON形式の文字列 →　List型
    final List decoded = jsonDecode(historyJson);
    // List型　→ List<AnswerHistory>
    historyList = decoded.map((e) => AnswerHistory.fromJson(e)).toList();
  }

  // 既存の同じnoがあれば削除（上書き）
  historyList.removeWhere((item) => item.no == no);

  // 新しい回答を追加
  historyList.add(AnswerHistory(no: no, answer: answer, correct: correct));

  // List<AnswerHistory> → JSON形式の文字列
  String encoded = jsonEncode(historyList.map((e) => e.toJson()).toList());
  // バージョン保存
  await prefs.setInt('version', version);

  // 問題の履歴保存
  await prefs.setString('history', encoded);
}

// 回答履歴を取得する関数
Future<List<AnswerHistory>> getAnswerHistory() async {
  final prefs = await SharedPreferences.getInstance();

  // 問題履歴
  final jsonString = prefs.getString('history');

  // 過去問version
  final version = prefs.getInt('version');
  if (jsonString == null) return [];
  final List<dynamic> jsonData = jsonDecode(jsonString);
  final List<AnswerHistory> result = jsonData.map((e) => AnswerHistory.fromJson(e)).toList();
  return result;
}
