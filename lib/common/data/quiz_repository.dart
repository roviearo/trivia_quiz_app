import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_quiz_app/common/services/quiz_service.dart';
import 'package:trivia_quiz_app/features/quiz/models/quiz_question.dart';
import 'package:trivia_quiz_app/features/settings/models/quiz_category.dart';

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  QuizService quizService = ref.watch(quizServiceProvider);
  return QuizRepository(quizService);
});

final quizQuestionsProvider = FutureProvider.autoDispose<List<QuizQuestion>?>(
    (ref) => ref.watch(quizRepositoryProvider).getQuestions());

final quizCategoryProvider = FutureProvider.autoDispose<List<QuizCategory>?>(
    (ref) => ref.watch(quizRepositoryProvider).getCategories());

class QuizRepository {
  QuizRepository(this.quizService);
  final QuizService quizService;

  Future<List<QuizQuestion>?> getQuestions() async {
    return await quizService.getQuestions();
  }

  Future<List<QuizCategory>?> getCategories() async {
    return await quizService.getCategories();
  }
}
