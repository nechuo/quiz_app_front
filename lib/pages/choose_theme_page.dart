import 'package:flutter/material.dart';

class ChooseThemePage extends StatefulWidget {
  const ChooseThemePage({super.key});

  @override
  State<StatefulWidget> createState() => ChooseThemePageState();
}

class ChooseThemePageState extends State<ChooseThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            child: Text("ChooseThemePage", style: TextStyle(fontSize: 50)),
          ),
        ],
      ),
    );
  }
}
