class AnswerHistory {
  final int no;
  final String answer;
  final String correct;

  AnswerHistory({required this.no, required this.answer, required this.correct});

  Map<String, dynamic> toJson() => {'no': no, 'answer': answer, 'correct': correct};

  factory AnswerHistory.fromJson(Map<String, dynamic> json) {
    return AnswerHistory(no: json['no'], answer: json['answer'], correct: json['correct']);
  }
}

// 現在未使用
class VersionHistory {
  final int version;
  final List<AnswerHistory> history;
  VersionHistory({required this.version, required this.history});

  Map<String, dynamic> toJson() {
    return {'version': version, 'history': history.map((e) => e.toJson()).toList()};
  }

  factory VersionHistory.fromJson(Map<String, dynamic> json) {
    return VersionHistory(
      version: json['version'] ?? 0,
      history: (json['history'] as List).map((item) => AnswerHistory.fromJson(item)).toList(),
    );
  }
}
