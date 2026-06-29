import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/history/widget/history_label.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Column(children: [HistoryLabel()])),
  );
}
