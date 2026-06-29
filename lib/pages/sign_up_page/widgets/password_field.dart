import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class PasswordField extends StatefulWidget {
  final String? errorMessage;
  final TextEditingController passwordController;
  final void Function(String newPasswordErrorMessage) setErrorMessage;

  const PasswordField({
    super.key,
    required this.errorMessage,
    required this.setErrorMessage,
    required this.passwordController,
  });

  @override
  State<StatefulWidget> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  void _onViewPasswordIconPressed() => setState(() {
    _isPasswordVisible = !_isPasswordVisible;
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
    child: TextField(
      obscureText: !_isPasswordVisible,
      controller: widget.passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorText: widget.errorMessage,
        hintText: t.sign_up_page.enter_password_label,
        labelText: t.sign_up_page.password_field_label,
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => _onViewPasswordIconPressed,
        ),
      ),
    ),
  );
}
