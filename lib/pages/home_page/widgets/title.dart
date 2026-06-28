import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      child: Text(
        t.home_page.new_game,
        style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      ),
    );
  }
}
