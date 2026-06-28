import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/matchmaking_page.dart';

class RunGameButton extends StatelessWidget {
  const RunGameButton({super.key});

  void _onRunGameButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchmakingPage()),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 40),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(
          top: 30,
          left: 50,
          right: 50,
          bottom: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 157, 110, 237),
      ),
      onPressed: () => _onRunGameButtonPressed(context),
      child: Text(
        t.home_page.run_game,
        style: const TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
  );
}
