import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/sing_in_page/sign_in_page.dart';
import "../../../i18n/generated/strings.g.dart";

class AlreadyHaveAccountLink extends StatelessWidget {
  const AlreadyHaveAccountLink({super.key});

  void _onSignInLabelLinkPressed(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignInPage()),
  );

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text(
            style: TextStyle(fontSize: 18),
            t.sign_up_page.already_have_account_label,
          ),
        ),
        InkWell(
          onTap: () => _onSignInLabelLinkPressed(context),
          child: Text(
            t.sign_up_page.sign_in_label,
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              color: const Color.fromARGB(255, 157, 110, 237),
            ),
          ),
        ),
      ],
    ),
  );
}
