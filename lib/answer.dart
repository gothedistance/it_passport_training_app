import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.answer,
    required this.show_answer,
    required this.answer_Visible,
  });

  final String answer;
  final VoidCallback show_answer;
  final bool answer_Visible;

  //  @override
  //  _AnswerState createState() => _AnswerState(); // ステートクラス作成
  //}
  //
  //class _AnswerState extends State<Answer> {
  //  bool answer_Visible = false; // 正解を非表示

  // 正解を表示するための、イベントを定義
  //void show_answer() {
  //  setState(() {
  //    answer_Visible = true; // ボタン押下時に正解を表示
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('▪️正解', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            if (!answer_Visible)
              ElevatedButton(
                onPressed: show_answer, // ボタンを押したら正解を表示
                child: Text('正解を表示する', style: TextStyle(color: Colors.black)),
              ),
            SizedBox(height: 10),
            if (answer_Visible) // ボタン押下後に正解を表示
              Text(
                answer,
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
