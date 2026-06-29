import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class WelcomeLabel extends StatelessWidget {
  const WelcomeLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 0),
    child: Text(
      t.sing_in_page.welcome_label,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
