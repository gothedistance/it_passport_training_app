import 'package:it_passport_training_app/feature/core/quiz.dart';

const List<Map<String, dynamic>> dummyData = [
  {
    "version": "令和６年",
    "id": 1,
    "question": "マーケティングオートメーション(MA)に関する記述として，最も適切なものはどれか。",
    "choice_questions": [
      {"key": "ア", "value": "企業内に蓄積された大量のデータを分析して，事業戦略などに有効活用する。    "},
      {"key": "イ", "value": "小売業やサービス業において，販売した商品単位の情報の収集・蓄積及び分析を行う。"},
      {
        "key": "ウ",
        "value": "これまで人間が手作業で行っていた定型業務を，AIや機械学習などを取り入れたソフトウェアのロボットが代行することによって自動化や効率化を図る。",
      },
      {"key": "エ", "value": "見込み顧客の抽出，獲得，育成などの営業活動を効率化する。"},
    ],
    "classification": "ストラテジ系 > 経営戦略マネジメント > マーケティング",
    "answer": 4,
    "descriptions": {
      "summary":
          "マーケティングオートメーションは、その名のとおり顧客獲得・維持のためのマーケティング活動をITシステムで自動化するための仕組みです。従来は営業担当が人力で行っていた、メール、LINE、SNSなどの配信や効果の測定、見込み顧客の管理、顧客の興味に応じたアプローチ、有望な見込み顧客の可視化、データ分析などをシステム上で行えるようにすることで、マーケティング活動の効率化を図ることができます。見込み顧客に継続的にフォローするためにはコストが掛かりますが、これを自動化することで新規商談の増加を期待できるなどの強みがあります。したがって、見込み顧客の管理について記述している「エ」が適切です。",
      "answer": [
        {"key": "ア", "kaisetu": "データマイニングに関する記述です。"},
        {"key": "イ", "kaisetu": "POS(Point Of Sales)に関する記述です。"},
        {"key": "ウ", "kaisetu": "RPA(Robotic Process Automation)に関する記述です。"},
        {"key": "エ", "kaisetu": "正しい。マーケティングオートメーションに関する記述です。"},
      ],
    },
  },
  {
    "version": "令和６年",
    "id": 2,
    "question":
        "情報システムに不正に侵入し，サービスを停止させて社会的混乱を生じさせるような行為に対して，国全体で体系的に防御施策を講じるための基本理念を定め，国の責務などを明らかにした法律はどれか。",
    "choice_questions": [
      {"key": "ア", "value": "公益通報者保護法"},
      {"key": "イ", "value": "サイバーセキュリティ基本法"},
      {"key": "ウ", "value": "不正アクセス禁止法"},
      {"key": "エ", "value": "プロバイダ責任制限法"},
    ],
    "classification": "ストラテジ系 > 法務 > セキュリティ関連法規",
    "answer": 2,
    "descriptions": {
      "summary": "サイバーセキュリティ基本法は...",
      "answer": [
        {"key": "ア", "kaisetu": "公益通報者保護法は..."},
        {"key": "イ", "kaisetu": "正しい。サイバーセキュリティ基本法は..."},
        {"key": "ウ", "kaisetu": "不正アクセス禁止法は..."},
        {"key": "エ", "kaisetu": "プロバイダ責任制限法は..."},
      ],
    },
  },
];

//final quizData = Quiz.fromJson(dummyData[1]);
final List<Quiz> quizList = dummyData.map((data) => Quiz.fromJson(data)).toList();
