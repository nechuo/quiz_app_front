import "package:flutter/material.dart";

class RoundNameLabel extends StatelessWidget {
  final String roundName;

  const RoundNameLabel({super.key, required this.roundName});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 50, bottom: 20),
    child: Text(roundName, style: TextStyle(fontSize: 45)),
  );
}
