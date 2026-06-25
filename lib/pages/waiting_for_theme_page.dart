import 'package:flutter/material.dart';

class WaitingForThemePage extends StatefulWidget {
  const WaitingForThemePage({super.key});

  @override
  State<StatefulWidget> createState() => WaitingForThemePageState();
}

class WaitingForThemePageState extends State<WaitingForThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            child: Text("WaitingForThemePage", style: TextStyle(fontSize: 50)),
          ),
        ],
      ),
    );
  }
}
