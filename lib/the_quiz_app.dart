import 'package:flutter/material.dart';

import 'common/navigation/router.dart';

class TheQuizApp extends StatelessWidget {
  const TheQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'The Quiz App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
