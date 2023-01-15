import 'package:trivia_quiz_app/common/utils/enums.dart';
import 'package:trivia_quiz_app/features/settings/models/quiz_category.dart';

class SettingsState {
  final int numQuestions;
  final QuizCategory category;
  final Difficulty difficulty;

  const SettingsState({
    required this.numQuestions,
    required this.category,
    required this.difficulty,
  });

  factory SettingsState.initial() {
    return const SettingsState(
      numQuestions: 5,
      category: QuizCategory(id: 9, name: 'General Knowledge'),
      difficulty: Difficulty.any,
    );
  }

  SettingsState copyWith({
    int? numQuestions,
    QuizCategory? category,
    Difficulty? difficulty,
  }) {
    return SettingsState(
      numQuestions: numQuestions ?? this.numQuestions,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
