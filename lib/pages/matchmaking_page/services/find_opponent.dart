import 'package:quiz_app_front/main.dart';
import 'package:quiz_app_front/pages/matchmaking_page/assets/names.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import 'package:quiz_app_front/shared_assets/themes.dart';

import 'package:quiz_app_front/shared_models/theme.dart';

String _findRandomName() => names[randomInstance.nextInt(names.length)];

Map<Theme, double> _generateRandomAccuracyPerTheme() {
  Map<Theme, double> accuracyPerTheme = {};
  for (Theme theme in themes) {
    accuracyPerTheme[theme] = randomInstance.nextDouble();
  }
  return accuracyPerTheme;
}

Player findOpponent() => Player(
  isBot: true,
  totalScore: 0,
  totalPlayedGames: 0,
  name: _findRandomName(),
  accuracyPerTheme: _generateRandomAccuracyPerTheme(),
);
