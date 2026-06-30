// Title already exists in the Flutter framework.
// Since this page does not use this one, then hide it to avoid a collision with our custom Title widget.
import 'package:flutter/material.dart' hide Title;
import 'package:quiz_app_front/pages/home_page/widgets/app_bar.dart';
import 'package:quiz_app_front/pages/home_page/widgets/title.dart';
import 'package:quiz_app_front/pages/home_page/widgets/run_game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(226, 96, 71, 219),
            Color.fromARGB(92, 100, 231, 148),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Title(), RunGameButton()],
          ),
        ),
      ),
    );
  }
}
