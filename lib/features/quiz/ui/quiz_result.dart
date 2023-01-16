// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_quiz_app/common/data/quiz_repository.dart';
import 'package:trivia_quiz_app/common/ui/the_quiz_button.dart';
import 'package:trivia_quiz_app/features/quiz/controllers/quiz_controller.dart';

import 'package:trivia_quiz_app/features/quiz/models/quiz_question.dart';

import '../controllers/quiz_state.dart';

class QuizResult extends ConsumerWidget {
  const QuizResult({
    super.key,
    required this.state,
    required this.questions,
  });

  final QuizState state;
  final List<QuizQuestion> questions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${state.correct.length} / ${questions.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'CORRECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        TheQuizButton(
          title: 'New Quiz',
          onPressed: () {
            ref.invalidate(quizRepositoryProvider);
            ref.read(quizControllerProvider.notifier).reset();
          },
        ),
      ],
    );
  }
}
