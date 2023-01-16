import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trivia_quiz_app/common/data/quiz_repository.dart';
import 'package:trivia_quiz_app/common/navigation/routes.dart';
import 'package:trivia_quiz_app/common/ui/display_error.dart';
import 'package:trivia_quiz_app/common/ui/the_quiz_button.dart';
import 'package:trivia_quiz_app/common/utils/enums.dart';
import 'package:trivia_quiz_app/features/quiz/controllers/quiz_controller.dart';
import 'package:trivia_quiz_app/features/quiz/ui/quiz_question.dart';
import 'package:trivia_quiz_app/features/quiz/ui/quiz_result.dart';

class QuizPage extends HookConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(quizQuestionsProvider);
    final pageController = usePageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('The Quiz App'),
        leading: IconButton(
          onPressed: () {
            context.goNamed(
              AppRoute.settings.name,
            );
          },
          icon: const Icon(Icons.settings),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                // context.goNamed(AppR)
              },
              child: const Icon(
                Icons.calendar_month_outlined,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: questions.when(
        data: (data) {
          final quizState = ref.watch(quizControllerProvider);
          return quizState.status == QuizStatus.complete
              ? QuizResult(state: quizState, questions: data!)
              : QuizQuestions(
                  pageController: pageController,
                  state: quizState,
                  questions: data!,
                );
        },
        error: (error, stackTrace) => const DisplayError(),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      bottomSheet: questions.maybeWhen(
        data: (data) {
          final quizState = ref.watch(quizControllerProvider);
          if (!quizState.answered) return const SizedBox.shrink();
          if (!pageController.hasClients) return const SizedBox.shrink();

          return TheQuizButton(
            title: pageController.page!.toInt() + 1 < data!.length
                ? 'Next Question'
                : 'See Results',
            onPressed: () {
              ref
                  .read(quizControllerProvider.notifier)
                  .next(data, pageController.page!.toInt());
              if (pageController.page!.toInt() + 1 < data.length) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              }
            },
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
