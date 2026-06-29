import "package:flutter/material.dart";
import "../models/question.dart";

class QuestionLabel extends StatelessWidget {
  final Question currentQuestion;

  const QuestionLabel({super.key, required this.currentQuestion});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 20),
    child: Text(
      textAlign: TextAlign.center,
      currentQuestion.getQuestion(),
      style: TextStyle(fontSize: 35),
    ),
  );
}
