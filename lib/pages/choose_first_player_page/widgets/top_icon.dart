import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  const TopIcon({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 50, bottom: 20),
    child: Text(
      "⚔️",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 70),
    ),
  );
}
