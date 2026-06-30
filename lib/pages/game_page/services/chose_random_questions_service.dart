import 'package:quiz_app_front/pages/game_page/services/fetch_questions_service.dart';
import "dart:math";

import '../../../shared_models/theme.dart';

Random _random = Random();

Future<List<Map<String, dynamic>>> choseRandomQuestionsService(
  Theme theme,
) async {
  List<Map<String, dynamic>> allThemeQuestions = await fetchQuestionsService(
    theme,
  );
  List<Map<String, dynamic>> chosenQuestions = [];
  for (int i = 0; i < 5; i++) {
    chosenQuestions.add(
      allThemeQuestions[_random.nextInt(allThemeQuestions.length)],
    );
  }
  return chosenQuestions;
}
