import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class ConfirmPasswordField extends StatefulWidget {
  final String? errorMessage;
  final TextEditingController confirmPasswordController;
  final void Function(String newConfirmPasswordErrorMessage) setErrorMessage;

  const ConfirmPasswordField({
    super.key,
    required this.errorMessage,
    required this.setErrorMessage,
    required this.confirmPasswordController,
  });

  @override
  State<StatefulWidget> createState() => ConfirmPasswordFieldState();
}

class ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _isConfirmPasswordVisible = false;

  void _onViewConfirmPasswordIconPressed() => setState(() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
    child: TextField(
      controller: widget.confirmPasswordController,
      obscureText: !_isConfirmPasswordVisible,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorText: widget.errorMessage,
        hintText: t.sign_up_page.confirm_your_password,
        labelText: t.sign_up_page.confirm_password_label,
        suffixIcon: IconButton(
          icon: Icon(
            _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _onViewConfirmPasswordIconPressed,
        ),
      ),
      onChanged: widget.setErrorMessage,
    ),
  );
}
