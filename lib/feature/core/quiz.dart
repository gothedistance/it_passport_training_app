class Quiz {
  final int id;
  final String question;
  final List<Options> options;
  final String correctAnswer;
  final AnswerDescription explanation;

  // コンストラクタ
  Quiz({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
  // コンストラクタ(クラスの変数ではない引数を元にオブジェクトを作るキーワードがfactory)
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as int,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>).map((e) => Options.fromJson(e)).toList(),
      correctAnswer: json['correct_answer'] as String,
      explanation: AnswerDescription.fromJson(json['explanation']),
    );
  }
  //List<Choices> getChoices() => choicesという変数で表現したもの
  List<Choices> get choices {
    return options.map((option) {
      return Choices.fromJson({
        'key': option.value.substring(0, 1),
        'value': option.value.substring(1, option.value.length),
      });
    }).toList();
  }
}

class Options {
  final String value;
  //{"key": "ア", "value": "企業内に蓄積された大量のデータを分析して，事業戦略などに有効活用する"},
  Options({required this.value});

  factory Options.fromJson(String option) {
    return Options(value: option);
  }
}

class Choices {
  final String key;
  final String value;

  Choices({required this.key, required this.value});

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(key: json['key'] as String, value: json['value'] as String);
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
