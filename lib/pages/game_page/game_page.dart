//import 'dart:async';

import 'package:flutter/material.dart' hide Theme;
import 'package:quiz_app_front/pages/game_page/assets/questions.dart';
import 'package:quiz_app_front/pages/game_page/services/fetch_questions_service.dart';
import 'package:quiz_app_front/pages/game_page/widgets/question_label.dart';
import 'package:quiz_app_front/pages/game_page/widgets/round_name_label.dart';
import 'package:quiz_app_front/pages/game_page/widgets/answer_suggestion.dart';
import 'package:quiz_app_front/pages/between_rounds_page/between_rounds_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';

import '../../shared_models/theme.dart';

class GamePage extends StatefulWidget {
  final Theme theme;
  final String roundName;
  final Player opponent;

  const GamePage({
    super.key,
    required this.roundName,
    required this.theme,
    required this.opponent,
  });

  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  int redAnswerIndex = -1;
  int greenAnswerIndex = -1;
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> quetions = [];

  Future<void> _fetchQuestions() async {
    List<Map<String, dynamic>> newQuestions = await fetchQuestionsService(
      widget.theme,
    );
    if (!mounted) return;
    setState(() => quetions = newQuestions);
  }

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  void _onSuggestionPressed(int cardIndex) {
    int correctAnswerIndex = questions[currentQuestionIndex]
        .getCorrectAnswerIndex();
    if (correctAnswerIndex == cardIndex) {
      setState(() => greenAnswerIndex = cardIndex);
    } else {
      setState(() {
        redAnswerIndex = cardIndex;
        greenAnswerIndex = correctAnswerIndex;
      });
    }

    // When the user presses a suggestion, then display the results (correct answer or not).
    // In order to have enough time to process these results, then wait for one second before switching to the next question.
    // If this question was the last one, then redirect to the "between rounds" page to allow the opponents to display the results of the whole round.
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        redAnswerIndex = -1;
        greenAnswerIndex = -1;
        if (currentQuestionIndex < 4) {
          currentQuestionIndex++;
          questions[currentQuestionIndex];
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BetweenRoundsPage(opponent: widget.opponent),
            ),
          );
        }
      });
    });
  }

  Color _calculateSuggestionBgColor(int cardIndex) =>
      greenAnswerIndex == cardIndex
      ? Colors.green
      : redAnswerIndex == cardIndex
      ? Colors.red
      : Colors.white70;

  Color _calculateSuggestionTextColor(int cardIndex) {
    Color cardColor = _calculateSuggestionBgColor(cardIndex);
    return cardColor != Colors.white70 ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  RoundNameLabel(roundName: widget.roundName),
                  QuestionLabel(
                    currentQuestion: questions[currentQuestionIndex],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnswerSuggestion(
                              suggestionIndex: 0,
                              suggestionLabel: questions[currentQuestionIndex]
                                  .getOptions()[0],
                              onSuggestionPressed: _onSuggestionPressed,
                              calculateSuggestionBgColor:
                                  _calculateSuggestionBgColor,
                              calculateSuggestionTextColor:
                                  _calculateSuggestionTextColor,
                            ),
                            AnswerSuggestion(
                              suggestionIndex: 1,
                              suggestionLabel: questions[currentQuestionIndex]
                                  .getOptions()[1],
                              onSuggestionPressed: _onSuggestionPressed,
                              calculateSuggestionBgColor:
                                  _calculateSuggestionBgColor,
                              calculateSuggestionTextColor:
                                  _calculateSuggestionTextColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnswerSuggestion(
                              suggestionIndex: 2,
                              suggestionLabel: questions[currentQuestionIndex]
                                  .getOptions()[2],
                              onSuggestionPressed: _onSuggestionPressed,
                              calculateSuggestionBgColor:
                                  _calculateSuggestionBgColor,
                              calculateSuggestionTextColor:
                                  _calculateSuggestionTextColor,
                            ),
                            AnswerSuggestion(
                              suggestionIndex: 3,
                              suggestionLabel: questions[currentQuestionIndex]
                                  .getOptions()[3],
                              onSuggestionPressed: _onSuggestionPressed,
                              calculateSuggestionBgColor:
                                  _calculateSuggestionBgColor,
                              calculateSuggestionTextColor:
                                  _calculateSuggestionTextColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
