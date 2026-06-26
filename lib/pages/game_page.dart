import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            child: Text("GamePage", style: TextStyle(fontSize: 50)),
          ),
        ],
      ),
    );
  }
}
