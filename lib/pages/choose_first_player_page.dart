import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/choose_theme_page.dart';
import 'package:quiz_app_front/pages/waiting_for_theme_page.dart';
import 'package:quiz_app_front/widgets/fade_button.dart';
import 'package:quiz_app_front/widgets/fade_text.dart';
import "dart:async";
import "dart:math";

class ChooseFirstPlayerPage extends StatefulWidget {
  final String opponentName;

  const ChooseFirstPlayerPage({super.key, required this.opponentName});

  @override
  State<ChooseFirstPlayerPage> createState() => ChooseFirstPlayerPageState();
}

class ChooseFirstPlayerPageState extends State<ChooseFirstPlayerPage> {
  bool isButtonDisplayed = false;

  Color meBgColor = Colors.white70;
  Color opponentBgColor = Colors.white70;

  Color meTextColor = Colors.black;
  Color oppenentTextColor = Colors.black;

  int firstPlayer = 0;

  @override
  void initState() {
    super.initState();
    firstPlayer = Random().nextInt(2);
    int count = 0;
    int maxCount = 6 + firstPlayer;

    Future.delayed(const Duration(seconds: 1), () {
      Timer.periodic(const Duration(milliseconds: 200), (timer) {
        count++;
        if (count <= maxCount) {
          setState(() {
            if (meBgColor == Colors.white70) {
              meBgColor = Colors.purple;
              meTextColor = Colors.white;
              opponentBgColor = Colors.white70;
              oppenentTextColor = Colors.black;
            } else {
              meBgColor = Colors.white70;
              meTextColor = Colors.black;
              opponentBgColor = Colors.purple;
              oppenentTextColor = Colors.white;
            }
          });
        } else {
          timer.cancel();
          setState(() => isButtonDisplayed = true);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              "⚔️",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 70),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 30),
            child: Text(
              "Choix du premier joueur",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Card(
              color: opponentBgColor,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 70, bottom: 70),
                  child: FadeTextWidget(
                    text: "Adversaire",
                    fontSize: 50,
                    color: oppenentTextColor,
                  ),
                ),
              ),
            ),
          ),

          Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              "VS",
              style: TextStyle(fontSize: 50, color: Colors.deepPurple),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Card(
              color: meBgColor,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 70, bottom: 70),
                  child: FadeTextWidget(
                    text: "Moi",
                    fontSize: 50,
                    color: meTextColor,
                  ),
                ),
              ),
            ),
          ),
          if (isButtonDisplayed)
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(50),
              child: FadeButtonWidget(
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (firstPlayer == 1) {
                          return ChooseThemePage();
                        } else {
                          return WaitingForThemePage();
                        }
                      },
                    ),
                  );
                },
                fontSize: 30,
                text: "Commencer la partie",
              ),
            ),
        ],
      ),
    );
  }
}
