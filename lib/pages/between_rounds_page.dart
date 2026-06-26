import 'package:flutter/material.dart';

class BetweenRoundsPage extends StatefulWidget {
  const BetweenRoundsPage({super.key});

  @override
  State<StatefulWidget> createState() => BetweenRoundsPageState();
}

class BetweenRoundsPageState extends State<BetweenRoundsPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80, bottom: 150),
              child: Text(
                "Statut des manches",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
