import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class ChooseThemeLabel extends StatelessWidget {
  const ChooseThemeLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 50, bottom: 20),
    child: Text(
      t.choose_theme_page.choose_theme_label,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    ),
  );
}
