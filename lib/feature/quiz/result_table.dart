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
        future: getAnswerHistory(2020),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final result = snapshot.data!;
            //final List<AnswerHistory> result = data.expand((e) => e.history).toList();
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
Future<void> saveAnswer(int no, String answer, String correct, int currentVersion) async {
  final prefs = await SharedPreferences.getInstance();
  //const int currentVersion = 2020;

  String? data = prefs.getString('history');
  List<VersionHistory> fullHistory = [];

  if (data != null) {
    final List decoded = jsonDecode(data);
    fullHistory = decoded.map((e) => VersionHistory.fromJson(e)).toList();
  }

  // 現在のバージョンが存在するか確認
  VersionHistory? current = fullHistory.firstWhere(
    (vh) => vh.version == currentVersion,
    orElse: () => VersionHistory(version: currentVersion, history: []),
  );

  // 同じ no の回答があれば削除（上書き対応）
  current.history.removeWhere((item) => item.no == no);
  current.history.add(AnswerHistory(no: no, answer: answer, correct: correct));

  // fullHistory に current を再登録（重複防止）
  fullHistory.removeWhere((vh) => vh.version == currentVersion);
  fullHistory.add(current);

  // 保存
  await prefs.setString('history', jsonEncode(fullHistory.map((e) => e.toJson()).toList()));
  print(jsonEncode(fullHistory.map((e) => e.toJson()).toList()));
}

// 回答履歴を取得する関数
Future<List<AnswerHistory>> getAnswerHistory(int currentVersion) async {
  final prefs = await SharedPreferences.getInstance();

  // 問題履歴
  final jsonString = prefs.getString('history');

  if (jsonString == null) return [];
  final List<dynamic> jsonData = jsonDecode(jsonString);
  final List<VersionHistory> versionHistories =
      jsonData.map((e) => VersionHistory.fromJson(e as Map<String, dynamic>)).toList();

  // 指定されたversionに一致するhistoryのみ抽出
  final matchingVersion = versionHistories.firstWhere(
    (vh) => vh.version == currentVersion,
    orElse: () => VersionHistory(version: currentVersion, history: []), // 見つからない場合は空のhistory
  );

  return matchingVersion.history;
}
