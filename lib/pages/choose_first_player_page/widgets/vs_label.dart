import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';

class VsLabel extends StatelessWidget {
  const VsLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 85,
    alignment: Alignment.center,
    child: Text(
      t.choose_first_player_page.vs_label,
      style: TextStyle(fontSize: 50, color: Colors.deepPurple),
    ),
  );
}
