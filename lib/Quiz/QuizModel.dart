import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  String question;
  List<String> answer;
  int indexOfCorrect;

  QuizModel({
    required this.question,
    required this.answer,
    required this.indexOfCorrect,
  });

  QuizModel copyWith({
    String? question,
    List<String>? answer,
    int? indexOfCorrect,
  }) {
    return QuizModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      indexOfCorrect: indexOfCorrect ?? this.indexOfCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
      'indexOfCorrect': indexOfCorrect,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'],
      answer: List<String>.from(map['answer']),
      indexOfCorrect: map['indexOfCorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'QuizModel(question: $question, answer: $answer, indexOfCorrect: $indexOfCorrect)';
  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        listEquals(other.answer, answer) &&
        other.indexOfCorrect == indexOfCorrect;
  }

  @override
  int get hashCode =>
      question.hashCode ^ answer.hashCode ^ indexOfCorrect.hashCode;
}
