import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        child: Padding(padding: const EdgeInsets.all(8.0), child: Text("回答する")),
      ),
    );
  }
}

//　正解、不正解をダイヤログ表示するメソッド
void showAnswerDialog(BuildContext context, message, icon, Color color) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Column(
          children: [
            Text(icon, style: TextStyle(fontSize: 100, color: color)),
            Text(message, style: TextStyle(color: color)),
          ],
        ),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK')),
        ],
      );
    },
  );
}
