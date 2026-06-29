import 'package:flutter/material.dart';

class AnswerSuggestion extends StatelessWidget {
  // There are 4 answer suggestions.
  // Here is the suggestion index representation in the UI:
  // question ????
  // suggestions:
  // 1 2
  // 3 4
  final int suggestionIndex;
  final String suggestionLabel;
  final void Function(int suggestionIndex) onSuggestionPressed;
  final Color Function(int suggestionIndex) calculateSuggestionBgColor;
  final Color Function(int suggestionIndex) calculateSuggestionTextColor;

  const AnswerSuggestion({
    super.key,
    required this.suggestionIndex,
    required this.suggestionLabel,
    required this.onSuggestionPressed,
    required this.calculateSuggestionBgColor,
    required this.calculateSuggestionTextColor,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: 150,
    margin: EdgeInsets.only(right: 20),
    child: Card(
      color: calculateSuggestionBgColor(suggestionIndex),
      child: InkWell(
        onTap: () => onSuggestionPressed(suggestionIndex),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              maxLines: 6,
              suggestionLabel,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                color: calculateSuggestionTextColor(suggestionIndex),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
