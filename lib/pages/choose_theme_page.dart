import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/game_page.dart';

class ChooseThemePage extends StatefulWidget {
  final String roundName;

  const ChooseThemePage({super.key, required this.roundName});

  @override
  State<StatefulWidget> createState() => ChooseThemePageState();
}

class ChooseThemePageState extends State<ChooseThemePage> {
  final themes = <Map<String, Object>>[
    {"name": "Biologie", "color": Colors.green},
    {"name": "Divertissement", "color": Colors.orange},
    {"name": "Géographie", "color": Colors.blue},
    {"name": "Histoire", "color": Colors.brown},
    {"name": "Littérature", "color": Colors.purple},
    {"name": "Mathématiques", "color": Colors.red},
    {"name": "Physique-Chimie", "color": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "Choisis un thème : ",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),

              ...themes.map(
                (theme) => Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: theme["color"] as Color,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GamePage(roundName: widget.roundName),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            theme["name"] as String,
                            style: TextStyle(fontSize: 40, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
