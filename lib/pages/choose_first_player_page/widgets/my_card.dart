import "package:flutter/material.dart";
import "../../../widgets/fade_text.dart";
import "../../../i18n/generated/strings.g.dart";

class MyCard extends StatelessWidget {
  final Color meBgColor;
  final Color meTextColor;

  const MyCard({super.key, required this.meBgColor, required this.meTextColor});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 30, right: 30),
    child: Card(
      color: meBgColor,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          child: FadeTextWidget(
            fontSize: 45,
            color: meTextColor,
            text: t.choose_first_player_page.me_label,
          ),
        ),
      ),
    ),
  );
}
