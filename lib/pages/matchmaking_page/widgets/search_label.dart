import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';

class SearchLabel extends StatelessWidget {
  const SearchLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 200, bottom: 200),
    child: Text(
      t.matchmaking_page.searching_game,
      style: TextStyle(fontSize: 40),
    ),
  );
}
