import "package:flutter/material.dart";

class QuestionLabel extends StatelessWidget {
  final String currentQuestion;

  const QuestionLabel({super.key, required this.currentQuestion});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 20),
    child: Text(
      textAlign: TextAlign.center,
      currentQuestion,
      style: TextStyle(fontSize: 35),
    ),
  );
}
