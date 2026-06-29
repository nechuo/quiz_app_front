import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";
import 'package:quiz_app_front/pages/forgot_password_page/forgot_password_page.dart';

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  void _onForgotPasswordLinkPressed(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ForgotPasswordPage(title: 'Forgot Password'),
    ),
  );

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Text(
            t.sing_in_page.forgot_password_label,
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              color: const Color.fromARGB(255, 157, 110, 237),
            ),
          ),
          onTap: () => _onForgotPasswordLinkPressed(context),
        ),
      ],
    ),
  );
}
