import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/home_page/home_page.dart';
import "../../../i18n/generated/strings.g.dart";
import 'package:quiz_app_front/pages/sing_in_page/services/sing_in_service.dart';

class ConnectButton extends StatefulWidget {
  final String? Function() validateEmail;
  final String? Function() validatePassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function(String newEmailErrorMessage) setEmailErrorMessage;

  const ConnectButton({
    super.key,
    required this.validateEmail,
    required this.emailController,
    required this.validatePassword,
    required this.passwordController,
    required this.setEmailErrorMessage,
  });

  @override
  State<StatefulWidget> createState() => ConnectButtonState();
}

class ConnectButtonState extends State<ConnectButton> {
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          bool isValidUsername = widget.validateEmail() == null;
          bool isValidPassword = widget.validatePassword() == null;
          if (!isValidPassword || !isValidUsername) {
            return;
          }

          final navigator = Navigator.of(context);

          String message = await signIn(
            widget.emailController.text,
            widget.passwordController.text,
          );

          if (message == t.sing_in_page.ok) {
            navigator.push(MaterialPageRoute(builder: (_) => HomePage()));
          } else {
            widget.setEmailErrorMessage(message);
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          backgroundColor: const Color.fromARGB(255, 157, 110, 237),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(t.sing_in_page.login_label),
      ),
    ),
  );
}
