import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/profile_page/widgets/my_profile.dart';
import 'package:quiz_app_front/pages/profile_page/widgets/settings_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(226, 96, 71, 219),
            Color.fromARGB(92, 100, 231, 148),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(child: Column(children: [SettingsButton(), MyProfile()])),
      ),
    );
  }
}
