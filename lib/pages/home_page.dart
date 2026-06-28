import 'package:flutter/material.dart';
import 'matchmaking_page.dart';
import '../i18n/generated/strings.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onRunGameButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchmakingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0),
              child: Text(
                t.home_page.new_game,
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onRunGameButtonPressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 157, 110, 237),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                  ),
                  child: Text(t.home_page.run_game),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
