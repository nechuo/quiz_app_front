import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40),

              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10),
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
                  Text("Nom d'utilisateur"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
