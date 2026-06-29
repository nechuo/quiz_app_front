import 'package:flutter/material.dart';
import 'package:quiz_app_front/i18n/generated/strings.g.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) => Container(
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
            backgroundColor: Colors.black12,
            radius: 50,
            child: const Text("Avatar"),
          ),
        ),
        Text(t.profile_page.user_name),
      ],
    ),
  );
}
