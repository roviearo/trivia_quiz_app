// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:trivia_quiz_app/features/quiz/controllers/quiz_controller.dart';

import 'package:trivia_quiz_app/features/quiz/models/quiz_question.dart';

class QuizAnswer extends ConsumerWidget {
  const QuizAnswer({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.isDisplayingAnswer,
    required this.question,
  });

  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayingAnswer;
  final QuizQuestion question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () =>
          ref.read(quizControllerProvider.notifier).answer(question, answer),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
          border: Border.all(
            color: isDisplayingAnswer
                ? isCorrect
                    ? Colors.green
                    : isSelected
                        ? Colors.red
                        : Colors.white
                : Colors.white,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                HtmlUnescape().convert(answer),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: isDisplayingAnswer && isCorrect
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
            ),
            if (isDisplayingAnswer)
              isCorrect
                  ? const Icon(Icons.check, color: Colors.green)
                  : isSelected
                      ? const Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.close,
                          color: Colors.red,
                        )
            else
              const Icon(
                Icons.question_mark,
                color: Colors.red,
              )
          ],
        ),
      ),
    );
  }
}
