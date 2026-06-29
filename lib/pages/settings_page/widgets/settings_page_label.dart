import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class SettingsPageLabel extends StatelessWidget {
  const SettingsPageLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(bottom: 30),
    child: Text(
      style: TextStyle(fontSize: 50),
      t.settings_page.settings_page_label,
    ),
  );
}
