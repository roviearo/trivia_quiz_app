import 'package:go_router/go_router.dart';
import 'package:trivia_quiz_app/common/navigation/routes.dart';
import 'package:trivia_quiz_app/features/quiz/ui/quiz_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const QuizPage(),
    ),
    GoRoute(
      path: '/settings',
      name: AppRoute.settings.name,
      builder: (context, state) => const QuizPage(),
    ),
    GoRoute(
      path: '/quizSessionsMap',
      name: AppRoute.home.name,
      builder: (context, state) => const QuizPage(),
    ),
    GoRoute(
      path: '/quizSessionsList/:sessionDate',
      name: AppRoute.home.name,
      builder: (context, state) => const QuizPage(),
    ),
  ],
);
