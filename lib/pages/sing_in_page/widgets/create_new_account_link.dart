import "package:flutter/material.dart";
import "../../../i18n/generated/strings.g.dart";
import "package:quiz_app_front/pages/sign_up_page/sign_up_page.dart";

class CreateNewAccountLink extends StatelessWidget {
  const CreateNewAccountLink({super.key});

  void _onCreateNewAccountLinkPressed(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignUpPage(title: 'Sign Up')),
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
            t.sing_in_page.create_account_link_label,
            style: TextStyle(fontSize: 18),
          ),
        ),
        InkWell(
          child: Text(
            t.sing_in_page.sign_up_label,
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              color: const Color.fromARGB(255, 157, 110, 237),
            ),
          ),
          onTap: () => _onCreateNewAccountLinkPressed(context),
        ),
      ],
    ),
  );
}
