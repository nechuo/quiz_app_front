// Theme already exists in the Flutter framework.
// Since this page does not use this one, then hide it to avoid a collision.
import 'package:flutter/material.dart' hide Theme;
import "../../i18n/generated/strings.g.dart";
import 'package:quiz_app_front/pages/choose_theme_page/widgets/theme.dart';
import 'package:quiz_app_front/pages/choose_theme_page/widgets/choose_theme_label.dart';

class ChooseThemePage extends StatefulWidget {
  final String roundName;

  const ChooseThemePage({super.key, required this.roundName});

  @override
  State<StatefulWidget> createState() => ChooseThemePageState();
}

class ChooseThemePageState extends State<ChooseThemePage> {
  final themes = <Map<String, Object>>[
    {"name": t.shared.theme_names.physics, "color": Colors.teal},
    {"name": t.shared.theme_names.biology, "color": Colors.green},
    {"name": t.shared.theme_names.history, "color": Colors.brown},
    {"name": t.shared.theme_names.geography, "color": Colors.blue},
    {"name": t.shared.theme_names.mathematics, "color": Colors.red},
    {"name": t.shared.theme_names.literature, "color": Colors.purple},
    {"name": t.shared.theme_names.entertainment, "color": Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ChooseThemeLabel(),
              ...themes.map(
                (theme) => Theme(
                  roundName: widget.roundName,
                  themeName: theme["name"] as String,
                  themeColor: theme["color"] as Color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
