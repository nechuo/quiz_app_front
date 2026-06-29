import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class SingInLabel extends StatelessWidget {
  const SingInLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
    child: Text(t.sing_in_page.sign_in_label, style: TextStyle(fontSize: 19)),
  );
}
