import "package:flutter/material.dart";
import "../../../i18n/generated/strings.g.dart";

class ForgotYourPasswordLabel extends StatelessWidget {
  const ForgotYourPasswordLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 50, bottom: 50),
    child: Text(
      t.forgot_password_page.forgot_your_password_label,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
  );
}
