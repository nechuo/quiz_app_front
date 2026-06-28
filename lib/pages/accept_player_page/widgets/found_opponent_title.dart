import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';

class FoundOpponentTitle extends StatelessWidget {
  const FoundOpponentTitle({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 60),
    child: Text(
      t.accept_player_page.found_opponent,
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}
