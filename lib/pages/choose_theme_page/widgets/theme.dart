import "package:flutter/material.dart";
import "package:quiz_app_front/pages/game_page/game_page.dart";

class Theme extends StatelessWidget {
  final Color themeColor;
  final String themeName;
  final String roundName;

  const Theme({
    super.key,
    required this.themeName,
    required this.roundName,
    required this.themeColor,
  });

  void _onThemePressed(BuildContext context) => {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GamePage(roundName: roundName)),
    ),
  };

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    child: SizedBox(
      width: double.infinity,
      child: Card(
        color: themeColor,
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              themeName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          onTap: () => _onThemePressed(context),
        ),
      ),
    ),
  );
}
