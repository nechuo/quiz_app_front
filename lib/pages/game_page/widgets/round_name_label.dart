import "package:flutter/material.dart";
import "package:quiz_app_front/i18n/generated/strings.g.dart";

class RoundNameLabel extends StatelessWidget {
  final int roundIndex;

  const RoundNameLabel({super.key, required this.roundIndex});

  String getI18nKeyFromIndex() {
    switch (roundIndex) {
      case (0):
        return "first";
      case (1):
        return "second";
      case (2):
        return "third";
      case (3):
        return "fourth";
      case (4):
        return "fifth";
      default:
        return "first";
    }
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 50, bottom: 20),
    child: Text(
      t['shared.round_names.${getI18nKeyFromIndex()}_round_name'],
      style: TextStyle(fontSize: 45),
    ),
  );
}
