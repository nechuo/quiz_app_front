import "package:flutter/material.dart";
import "../../../i18n/generated/strings.g.dart";
import "package:quiz_app_front/pages/home_page/home_page.dart";

class SendEmailButton extends StatelessWidget {
  const SendEmailButton({super.key});

  void _onSendEmailButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          backgroundColor: const Color.fromARGB(255, 157, 110, 237),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () => _onSendEmailButtonPressed(context),
        child: Text(t.forgot_password_page.send_button_label),
      ),
    ),
  );
}
