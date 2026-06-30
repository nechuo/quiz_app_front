import "dart:convert";
import "dart:io";
import "package:flutter/services.dart";
import "package:quiz_app_front/pages/matchmaking_page/models/player.dart";

const path = '../shared_assets/my_profile.json';

Future<Player> loadPlayerFromJson() async {
  final jsonString = await rootBundle.loadString(path);
  return jsonDecode(jsonString).cast(Player);
}

Future<void> writePlayerToJson(Player player) async {
  final file = File(path);
  final jsonString = jsonEncode(player.toJson());
  await file.writeAsString(jsonString);
}
