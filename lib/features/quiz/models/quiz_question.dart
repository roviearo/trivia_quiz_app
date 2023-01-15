import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_question.freezed.dart';

@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String? category,
    required String? difficulty,
    required String? type,
    required String? question,
    @JsonKey(name: 'correct_answer') required String? correctAnswer,
    @JsonKey(name: 'incorrect_answers') required List<String?> incorrectAnswer,
    required List<String?> answers,
  }) = _QuizQuestion;

  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      category: map['category'] ?? '',
      difficulty: map['difficulty'] ?? '',
      type: map['type'] ?? '',
      question: map['question'] ?? '',
      correctAnswer: map['correct_nswer'] ?? '',
      incorrectAnswer: map['incorrect_answers'].cast<String>() ?? [],
      answers: List<String>.from(map['incorrectAnswers'].cast<String>() ?? [])
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }
}
