import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  const Answer({super.key, required this.answer});

  final String answer;

  @override
  _AnswerState createState() => _AnswerState(); // ステートクラス作成
}

class _AnswerState extends State<Answer> {
  bool _isAnswerVisible = false; // 正解を非表示

  // 正解を表示するための、イベントを定義
  void _showAnswer() {
    setState(() {
      _isAnswerVisible = true; // ボタン押下時に正解を表示
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('▪️正解', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          if (!_isAnswerVisible)
            ElevatedButton(
              onPressed: _showAnswer, // ボタンを押したら正解を表示
              child: Text('正解を表示する', style: TextStyle(color: Colors.black)),
            ),
          SizedBox(height: 10),
          if (_isAnswerVisible) // ボタン押下後に正解を表示
            Text(
              widget.answer,
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
