//import 'dart:async';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String roundName;
  final int roundNumber;

  const GamePage({super.key, required this.roundName, this.roundNumber = 0});

  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  int currentQuestion = 0;

  final questions = <Map<String, Object>>[
    {
      "id": 1,
      "question":
          "Quel organite est souvent surnommé la « centrale énergétique » de la cellule ?",
      "options": ["La mitochondrie", "Le ribosome", "Le noyau", "Le lysosome"],
      "answer": 0,
    },
    {
      "id": 2,
      "question":
          "Quel scientifique a observé pour la première fois des « cellules » dans du liège en 1665 ?",
      "options": [
        "Antonie van Leeuwenhoek",
        "Theodor Schwann",
        "Robert Hooke",
        "Louis Pasteur",
      ],
      "answer": 2,
    },
    {
      "id": 3,
      "question":
          "Quel organite contient la majeure partie de l'ADN d'une cellule eucaryote ?",
      "options": [
        "L'appareil de Golgi",
        "Le cytoplasme",
        "Le réticulum endoplasmique",
        "Le noyau",
      ],
      "answer": 3,
    },
    {
      "id": 4,
      "question":
          "Quelle structure délimite la cellule et contrôle les échanges avec l'extérieur ?",
      "options": [
        "La lame basale",
        "Le cytosquelette",
        "La paroi cellulaire",
        "La membrane plasmique",
      ],
      "answer": 3,
    },
    {
      "id": 5,
      "question": "Les ribosomes sont le siège de quel processus cellulaire ?",
      "options": [
        "La respiration cellulaire",
        "La réplication de l'ADN",
        "La synthèse des protéines",
        "La photosynthèse",
      ],
      "answer": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40),
              child: Text(widget.roundName, style: TextStyle(fontSize: 50)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 100),
              child: Text(
                (questions[widget.roundNumber]["question"] as String),
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 200,
                        height: 200,
                        child: Card(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[widget.roundNumber]["options"]
                                      as List<String>)[0],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Card(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[widget.roundNumber]["options"]
                                      as List<String>)[1],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 200,
                        height: 200,
                        child: Card(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[widget.roundNumber]["options"]
                                      as List<String>)[2],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Card(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[widget.roundNumber]["options"]
                                      as List<String>)[3],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
