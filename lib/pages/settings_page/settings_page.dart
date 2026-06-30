import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/settings_page/widgets/back_arrow.dart';
import 'package:quiz_app_front/pages/settings_page/widgets/settings_page_label.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 96, 71, 219),
              Color.fromARGB(255, 100, 231, 148),
            ],
          ),
        ),
        child: Column(children: const [BackArrow(), SettingsPageLabel()]),
      ),
    );
  }
}
