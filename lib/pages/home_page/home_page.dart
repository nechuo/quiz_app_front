import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/home_page/widgets/title.dart';
import 'package:quiz_app_front/pages/home_page/widgets/run_game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [HomePageTitle(), RunGameButton()],
      ),
    ),
  );
}
