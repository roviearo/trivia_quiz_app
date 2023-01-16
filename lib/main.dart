import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_quiz_app/the_quiz_app.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: TheQuizApp(),
    ),
  );
}
