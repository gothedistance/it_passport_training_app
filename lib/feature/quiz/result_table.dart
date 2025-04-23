import 'dart:convert'; // ← JSON操作に必要！

import 'package:flutter/material.dart';
import 'package:it_passport_training_app/feature/core/answer_history.dart';
import 'package:it_passport_training_app/feature/quiz/components/review_questions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultTable extends StatefulWidget {
  final int currentVersion;
  const ResultTable({super.key, required this.currentVersion});
  @override
  State<ResultTable> createState() => ResultTableState();
}

class ResultTableState extends State<ResultTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('成績一覧'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.loop),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final String? data = prefs.getString('history');
              final List<dynamic> jsonData = data != null ? jsonDecode(data) : [];
              final List<VersionHistory> allHistory =
                  jsonData.map((e) => VersionHistory.fromJson(e)).toList();
              final List<AnswerHistory> reviewHistory =
                  allHistory
                      .firstWhere(
                        (v) => v.version == widget.currentVersion,
                        orElse:
                            () => VersionHistory(
                              version: widget.currentVersion,
                              history: [],
                            ), // history を空リストで初期化
                      )
                      .history
                      .where((h) => h.answer != h.correct)
                      .toList();
              // 不正解問題表示
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewQuestions(answerHistory: reviewHistory),
                ),
              );
              result == true ? setState(() {}) : null;
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getAnswerHistory(2021),
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
Future<void> saveAnswer(int no, String answer, String correct, int currentVersion) async {
  final prefs = await SharedPreferences.getInstance();

  String? data = prefs.getString('history');
  print(data);
  final List<VersionHistory> fullHistory =
      data != null
          ? (jsonDecode(data) as List).map((e) => VersionHistory.fromJson(e)).toList()
          : [];

  // 現在のバージョンが存在するか確認
  // 存在しなければ新しくversionを作成
  final VersionHistory current =
      fullHistory.any((vh) => vh.version == currentVersion)
          ? fullHistory.firstWhere((vh) => vh.version == currentVersion)
          : VersionHistory(version: currentVersion, history: []);

  // 現在のVersionで同じ　no の存在確認
  final index = current.history.indexWhere((item) => item.no == no);
  final newHistory = [...current.history];

  // 同じ　no が存在する場合上書き
  // 同じ　no が存在しない場合追加
  index != -1
      ? newHistory[index] = AnswerHistory(no: no, answer: answer, correct: correct)
      : newHistory.add(AnswerHistory(no: no, answer: answer, correct: correct));

  final updateCurrent = VersionHistory(version: current.version, history: newHistory);

  final updateFullHistory = [
    ...fullHistory.where((vh) => vh.version != currentVersion),
    updateCurrent,
  ];

  await prefs.setString('history', jsonEncode(updateFullHistory.map((e) => e.toJson()).toList()));
}

// 回答履歴を取得する関数
Future<List<AnswerHistory>> getAnswerHistory(int currentVersion) async {
  final prefs = await SharedPreferences.getInstance();

  // 問題履歴
  final jsonString = prefs.getString('history');
  final List<dynamic> jsonData = jsonString != null ? jsonDecode(jsonString) : [];
  final List<VersionHistory> versionHistories =
      jsonData.map((e) => VersionHistory.fromJson(e as Map<String, dynamic>)).toList();

  // 指定されたversionに一致するhistoryのみ抽出
  final matchingVersion = versionHistories.firstWhere(
    (vh) => vh.version == currentVersion,
    orElse: () => VersionHistory(version: currentVersion, history: []), // 見つからない場合は空のhistory
  );

  return matchingVersion.history;
}
