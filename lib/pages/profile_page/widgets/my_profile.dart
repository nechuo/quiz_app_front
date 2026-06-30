import 'package:flutter/material.dart' hide Theme;
import 'package:quiz_app_front/i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import 'package:quiz_app_front/shared_services/load_json.dart';

import '../../../shared_assets/themes.dart';
import '../../../shared_models/theme.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<StatefulWidget> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {
  Player? me;

  @override
  initState() {
    super.initState();
    _loadMyProfile();
  }

  Future<void> _loadMyProfile() async {
    Player myProfile = await loadPlayerFromJson();
    setState(() => me = myProfile);
  }

  String _displayAccuracyPerTheme() {
    String result = "";
    for (Theme theme in themes) {
      result +=
          '$theme: ${((me?.accuracyPerTheme[theme]! ?? 0) * 100).toInt()}%\n';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) => me == null
      ? Center(child: CircularProgressIndicator())
      : Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                t.profile_page.my_profile,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  radius: 50,
                  child: const Text("Avatar"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  'Précision:\n ${_displayAccuracyPerTheme()}',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
        );
}
