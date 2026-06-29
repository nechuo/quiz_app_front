import 'package:flutter/material.dart';
import 'package:quiz_app_front/widgets/fade_text.dart';

class OpponentCard extends StatelessWidget {
  final String opponentName;
  final Color opponentBgColor;
  final Color opponentTextColor;

  const OpponentCard({
    super.key,
    required this.opponentName,
    required this.opponentBgColor,
    required this.opponentTextColor,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
    child: Card(
      color: opponentBgColor,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          child: FadeTextWidget(
            fontSize: 45,
            text: opponentName,
            color: opponentTextColor,
          ),
        ),
      ),
    ),
  );
}
