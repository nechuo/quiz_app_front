import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class EmailField extends StatelessWidget {
  final String? errorMessage;
  final TextEditingController emailController;

  const EmailField({
    super.key,
    this.errorMessage,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
    child: TextField(
      controller: emailController,
      decoration: InputDecoration(
        errorText: errorMessage,
        border: OutlineInputBorder(),
        hintText: t.sing_in_page.enter_email_label,
        labelText: t.sing_in_page.email_field_label,
      ),
    ),
  );
}
