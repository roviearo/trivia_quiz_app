import 'package:flutter/material.dart';

class TheQuizButton extends StatelessWidget {
  const TheQuizButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent[700],
            textStyle: const TextStyle(fontSize: 18),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}
