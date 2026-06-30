import 'package:quiz_app_front/main.dart';

import '../../../shared_models/theme.dart';
import '../../matchmaking_page/models/player.dart';

int answerBotQuestion(
  Player bot,
  List<String> answerSuggestions,
  Theme theme,
  int correctAnswerIndex,
) {
  Map<Theme, double> accuracyForAllThemes = bot.getAccuracyPerTheme();
  double currentThemeAccuracy = accuracyForAllThemes[theme] ?? 0;
  bool isCorrectAnswer = randomInstance.nextDouble() < currentThemeAccuracy;
  if (isCorrectAnswer) {
    return correctAnswerIndex;
  } else {
    int totalSuggestions = answerSuggestions.length;
    List<int> wrongAnswersIndexes = [];
    for (int i = 0; i < totalSuggestions; i++) {
      if (i != correctAnswerIndex) wrongAnswersIndexes.add(i);
    }
    return wrongAnswersIndexes[randomInstance.nextInt(
      wrongAnswersIndexes.length,
    )];
  }
}
