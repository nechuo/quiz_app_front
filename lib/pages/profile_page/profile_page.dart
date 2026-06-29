import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/profile_page/widgets/my_profile.dart';
import 'package:quiz_app_front/pages/profile_page/widgets/settings_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Column(children: [SettingsButton(), MyProfile()])),
  );
}
