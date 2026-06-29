import "package:flutter/material.dart";
import "../../../i18n/generated/strings.g.dart";

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: t.forgot_password_page.enter_email,
        labelText: t.forgot_password_page.email_field_label,
      ),
    ),
  );
}
