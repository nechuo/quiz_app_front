import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MatchmakingPageLoadingAnimation extends StatelessWidget {
  const MatchmakingPageLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) => Container(
    child: LoadingAnimationWidget.waveDots(color: Colors.black, size: 200),
  );
}
