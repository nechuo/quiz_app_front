import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final String? errorMessage;
  final TextEditingController emailController;
  final void Function(String newEmailErrorMessage) setErrorMessage;

  const EmailField({
    super.key,
    this.errorMessage,
    required this.emailController,
    required this.setErrorMessage,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
    child: TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        errorText: errorMessage,
        hintText: 'Enter your Email',
        border: OutlineInputBorder(),
      ),
      onChanged: setErrorMessage,
    ),
  );
}
