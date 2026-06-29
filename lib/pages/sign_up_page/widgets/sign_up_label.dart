import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class SignUpLabel extends StatelessWidget {
  const SignUpLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
    child: Text(t.sign_up_page.sign_up_label, style: TextStyle(fontSize: 19)),
  );
}
