class Question {
  final String id;
  final String question;
  // Options offers a list of 4 answer suggestions.
  final List<String> options;
  // The index of the correct answer with Options.
  final int correctAnswerIndex;

  String getId() => id;
  String getQuestion() => question;
  List<String> getOptions() => options;
  int getCorrectAnswerIndex() => correctAnswerIndex;

  const Question({
    required this.id,
    required this.options,
    required this.question,
    required this.correctAnswerIndex,
  });

  static Question fromMap(Map<String, Object> map) {
    if (map["id"] is! String) throw Exception("Id type is wrong.");
    if (map["question"] is! String) throw Exception("Question type is wrong.");
    if (map["correctAnswerIndex"] is! int) {
      throw Exception("CorrectAnswerIndex type is wrong.");
    }
    if (map["options"] is! List<String>) {
      throw Exception("Option type is wrong.");
    }
    return Question(
      id: map["id"] as String,
      question: map["question"] as String,
      options: map["options"] as List<String>,
      correctAnswerIndex: map["correctAnswerIndex"] as int,
    );
  }
}
