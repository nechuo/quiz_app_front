import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app_front/main.dart';
import 'play_session_page.dart';

class MatchmakingPage extends StatefulWidget {
  const MatchmakingPage({super.key});

  @override
  State<MatchmakingPage> createState() => MatchmakingPageState();
}

class MatchmakingPageState extends State<MatchmakingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => const PlaySessionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.waveDots(color: Colors.black, size: 200),
      ),
    );
  }
}
