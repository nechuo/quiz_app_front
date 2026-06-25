import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  const Text(
                    "Mon profil",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 50,
                      child: const Text("Avatar"),
                    ),
                  ),
                  Text("Corentin"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
