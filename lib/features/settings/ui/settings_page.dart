import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trivia_quiz_app/common/data/quiz_repository.dart';
import 'package:trivia_quiz_app/common/utils/enums.dart';
import 'package:trivia_quiz_app/features/settings/controllers/settings_controller.dart';
import 'package:trivia_quiz_app/features/settings/models/quiz_category.dart';

class SettingsPage extends HookConsumerWidget {
  SettingsPage({super.key});

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(quizCategoryProvider);

    QuizCategory category;
    Difficulty difficulty;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: const EdgeInsets.only(left: 8),
          child: const Text(
            'Quiz App',
          ),
        ),
      ),
      body: categories.when(
        data: (data) {
          final settingsState = ref.watch(settingsControllerProvider);
          category = settingsState.category;
          final numQuestionsController = userEd
        },
        error: error,
        loading: loading,
      ),
    );
  }
}
