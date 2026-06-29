import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';

class ChooseFirstPlayerLabel extends StatelessWidget {
  const ChooseFirstPlayerLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 10, bottom: 20),
    child: Text(
      t.choose_first_player_page.choose_first_player,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30),
    ),
  );
}
