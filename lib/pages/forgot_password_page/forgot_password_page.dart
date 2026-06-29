import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/forgot_password_page/widgets/email_field.dart';
import 'package:quiz_app_front/pages/forgot_password_page/widgets/send_email_button.dart';
import 'package:quiz_app_front/pages/forgot_password_page/widgets/forgot_your_password_label.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key, required this.title});

  final String title;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ForgotYourPasswordLabel(),
            EmailField(),
            SendEmailButton(),
          ],
        ),
      ),
    );
  }
}
