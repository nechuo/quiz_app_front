import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";
import 'package:quiz_app_front/pages/sing_in_page/sign_in_page.dart';
import 'package:quiz_app_front/pages/sign_up_page/services/sign_up_service.dart';

class CreateAccountButton extends StatelessWidget {
  final String? Function() validateEmail;
  final String? Function() validatePassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function() validateConfirmPassword;
  final void Function(String newEmailErrorMessage) setEmailErrorMessage;

  const CreateAccountButton({
    super.key,
    required this.validateEmail,
    required this.emailController,
    required this.validatePassword,
    required this.passwordController,
    required this.setEmailErrorMessage,
    required this.validateConfirmPassword,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          bool isValidUsername = validateEmail() == null;
          bool isValidPassword = validatePassword() == null;
          bool isValidConfirmPassword = validateConfirmPassword() == null;

          if (!isValidPassword || !isValidUsername || !isValidConfirmPassword) {
            return;
          }

          final navigator = Navigator.of(context);

          String message = await signUpService(
            emailController.text,
            passwordController.text,
          );

          if (message == t.sign_up_page.ok) {
            navigator.push(MaterialPageRoute(builder: (_) => SignInPage()));
          } else {
            setEmailErrorMessage(message);
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          backgroundColor: const Color.fromARGB(255, 157, 110, 237),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(t.sign_up_page.create_account_button_label),
      ),
    ),
  );
}
