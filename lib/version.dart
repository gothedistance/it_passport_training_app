import 'package:flutter/material.dart';

class Version extends StatelessWidget {
  const Version({super.key, required this.version});

  // 年度問題を定義
  final String version;

  @override
  Widget build(BuildContext context) {
    return Text('ITパスポート$version', style: TextStyle(color: Colors.black));
  }
}
