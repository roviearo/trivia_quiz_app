import 'package:flutter/material.dart';

class TheQuizApp extends StatelessWidget {
  const TheQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
