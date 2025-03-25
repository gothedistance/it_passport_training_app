import 'package:flutter/material.dart';

class Classification extends StatelessWidget {
  const Classification({super.key, required this.classification});

  final String classification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('▪️分類', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(classification.toString()),
          ],
        ),
      ),
    );
  }
}
