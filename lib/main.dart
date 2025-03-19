import 'package:flutter/material.dart';
import 'package:it_passport_training_app/header_section_widget.dart';
import 'package:it_passport_training_app/question.dart';

void main() {
  runApp(const MyApp());
}

final question = Question(number: 1, title: "title");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('ITパスポート試験　過去問道場', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.orange,
          actions: [ElevatedButton(onPressed: () {}, child: Text('ログイン・ユーザ登録'))],
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSectionWidget(number: 1, title: question.title),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.2),
                      border: Border.all(),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(05),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('ア', style: TextStyle(color: Colors.black)),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                width: 550,
                                child: Text(
                                  '企業内に蓄積された大量のデータを分析して，事業戦略などに有効活用する。',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(05),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('イ', style: TextStyle(color: Colors.black)),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                width: 550,
                                child: Text(
                                  '小売業やサービス業において，販売した商品単位の情報の収集・蓄積及び分析を行う。',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(05),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('ウ', style: TextStyle(color: Colors.black)),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                width: 550,
                                child: Text(
                                  'これまで人間が手作業で行っていた定型業務を，AIや機械学習などを取り入れたソフトウェアのロボットが代行することによって自動化や効率化を図る。',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(05),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('エ', style: TextStyle(color: Colors.black)),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                width: 550,
                                child: Text(
                                  '見込み顧客の抽出，獲得，育成などの営業活動を効率化する。',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('▪️分類', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('ストラテジ系 > 経営戦略マネジメント > マーケティング'),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('▪️正解', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('正解を表示する', style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.2),
                      border: Border.all(),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('▪️正解', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          'マーケティングオートメーションは、その名のとおり顧客獲得・維持のためのマーケティング活動をITシステムで自動化するための仕組みです。従来は営業担当が人力で行っていた、メール、LINE、SNSなどの配信や効果の測定、見込み顧客の管理、顧客の興味に応じたアプローチ、有望な見込み顧客の可視化、データ分析などをシステム上で行えるようにすることで、マーケティング活動の効率化を図ることができます。見込み顧客に継続的にフォローするためにはコストが掛かりますが、これを自動化することで新規商談の増加を期待できるなどの強みがあります。したがって、見込み顧客の管理について記述している「エ」が適切です。',
                        ),
                        const Divider(thickness: 1),
                        Row(
                          children: [
                            Text('ア', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '企業内に蓄積された大量のデータを分析して，事業戦略などに有効活用する。',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('データマイニングに関する記述です。'),
                        SizedBox(height: 5),
                        const Divider(thickness: 1),
                        Row(
                          children: [
                            Text('イ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '小売業やサービス業において，販売した商品単位の情報の収集・蓄積及び分析を行う。',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('POS(Point Of Sales)に関する記述です。'),
                        SizedBox(height: 5),
                        const Divider(thickness: 1),
                        Row(
                          children: [
                            Text('ウ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'これまで人間が手作業で行っていた定型業務を，AIや機械学習などを取り入れたソフトウェアのロボットが代行することによって自動化や効率化を図る。',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('RPA(Robotic Process Automation)に関する記述です。'),
                        SizedBox(height: 5),
                        const Divider(thickness: 1),
                        Row(
                          children: [
                            Text('エ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '見込み顧客の抽出，獲得，育成などの営業活動を効率化する。',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('正しい。マーケティングオートメーションに関する記述です。'),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
