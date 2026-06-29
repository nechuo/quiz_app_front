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
  Widget build(BuildContext context) =>
      Scaffold(body: Column(children: [BackArrow(), SettingsPageLabel()]));
}
