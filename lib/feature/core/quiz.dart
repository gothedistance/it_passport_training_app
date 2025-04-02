class Quiz {
  final String version;
  final int id;
  final String question;
  final List<ChoiceQuestions> choices;
  final int answer;
  final String classification;
  final AnswerDescription descriptions;

  // コンストラクタ
  Quiz({
    required this.version,
    required this.id,
    required this.question,
    required this.choices,
    required this.answer,
    required this.classification,
    required this.descriptions,
  });
  // コンストラクタ(クラスの変数ではない引数を元にオブジェクトを作るキーワードがfactory)
  //factory Quiz.fromJson(Map<String, dynamic> json) {
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      version: json['version'] as String,
      id: json['id'] as int,
      question: json['question'] as String,
      choices:
          (json['choice_questions'] as List<Map<String, dynamic>>)
              .map((e) => ChoiceQuestions.fromJson(e))
              .toList(),
      answer: json['answer'] as int,
      classification: json['classification'] as String,
      descriptions: AnswerDescription.fromJson(json['descriptions']),
    );
  }
}

class ChoiceQuestions {
  final String key;
  final String value;
  //{"key": "ア", "value": "企業内に蓄積された大量のデータを分析して，事業戦略などに有効活用する"},
  ChoiceQuestions({required this.key, required this.value});

  factory ChoiceQuestions.fromJson(Map<String, dynamic> json) {
    return ChoiceQuestions(key: json['key'] as String, value: json['value'] as String);
  }
}

class AnswerMemo {
  final String key;
  final String kaisetu;
  // {"key": "ア", "kaisetu": "データマイニングに関する記述です。"},

  AnswerMemo({required this.key, required this.kaisetu});

  factory AnswerMemo.fromJson(Map<String, dynamic> json) {
    return AnswerMemo(key: json['key'] as String, kaisetu: json['kaisetu'] as String);
  }
}

class AnswerDescription {
  final String summary;
  final List<AnswerMemo> answers;

  AnswerDescription({required this.summary, required this.answers});

  factory AnswerDescription.fromJson(Map<String, dynamic> json) {
    return AnswerDescription(
      summary: json['summary'] as String,
      answers:
          (json['answer'] as List<Map<String, dynamic>>)
              .map((e) => AnswerMemo.fromJson(e))
              .toList(),
    );
  }
}
