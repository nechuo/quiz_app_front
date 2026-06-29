import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/settings_page/settings_page.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.all(40),
    child: Align(
      alignment: Alignment.topRight,
      child: InkWell(
        child: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ),
    ),
  );
}
