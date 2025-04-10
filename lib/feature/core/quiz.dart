class Quiz {
  final int id;
  final String question;
  final List<ChoiceQuestions> options;
  final String correct_answer;
  final AnswerDescription explanation;

  // コンストラクタ
  Quiz({
    required this.id,
    required this.question,
    required this.options,
    required this.correct_answer,
    required this.explanation,
  });
  // コンストラクタ(クラスの変数ではない引数を元にオブジェクトを作るキーワードがfactory)
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as int,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>).map((e) => ChoiceQuestions.fromJson(e)).toList(),
      correct_answer: json['correct_answer'] as String,
      explanation: AnswerDescription.fromJson(json['explanation']),
    );
  }
}

class ChoiceQuestions {
  final String value;
  //{"key": "ア", "value": "企業内に蓄積された大量のデータを分析して，事業戦略などに有効活用する"},
  ChoiceQuestions({required this.value});

  factory ChoiceQuestions.fromJson(String option) {
    return ChoiceQuestions(value: option);
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
  //final List<AnswerMemo> answers;

  AnswerDescription({required this.summary});

  factory AnswerDescription.fromJson(String explanation) {
    return AnswerDescription(
      summary: explanation,
      //answers:
      //    (json['answer'] as List<Map<String, dynamic>>)
      //        .map((e) => AnswerMemo.fromJson(e))
      //        .toList(),
    );
  }
}
