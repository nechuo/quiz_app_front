import 'package:flutter/material.dart';
import 'package:quiz_app_front/widgets/welcome_label.dart';
import 'package:quiz_app_front/pages/sing_in_page/widgets/email_field.dart';
import 'package:quiz_app_front/pages/sing_in_page/widgets/sign_in_label.dart';
import 'package:quiz_app_front/pages/sing_in_page/widgets/connect_button.dart';
import 'package:quiz_app_front/pages/sing_in_page/widgets/password_field.dart';
import 'package:quiz_app_front/pages/sing_in_page/widgets/forgot_password_link.dart';
import 'package:quiz_app_front/pages/sing_in_page/widgets/create_new_account_link.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail() {
    String? message;
    if (_emailController.text.isEmpty) {
      message = 'Email cannot be empty';
      setState(() {
        _emailErrorMessage = message;
      });
    } else if (!_emailController.text.contains('@')) {
      message = 'Invalid email format';
      setState(() {
        _emailErrorMessage = message;
      });
    } else {
      setState(() {
        _emailErrorMessage = null;
      });
    }
    return message;
  }

  String? _validatePassword() {
    String? message;
    if (_passwordController.text.isEmpty) {
      message = 'Password cannot be empty';
      setState(() {
        _passwordErrorMessage = message;
      });
    } else if (_passwordController.text.length < 6) {
      message = 'Password must be at least 6 characters long';
      setState(() {
        _passwordErrorMessage = message;
      });
    } else {
      setState(() {
        _passwordErrorMessage = null;
      });
    }
    return message;
  }

  void _setEmailErrorMessage(String newEmailErrorMessage) =>
      setState(() => _emailErrorMessage = newEmailErrorMessage);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          WelcomeLabel(),
          SingInLabel(),
          EmailField(
            errorMessage: _emailErrorMessage,
            emailController: _emailController,
          ),
          PasswordField(
            errorMessage: _passwordErrorMessage,
            passwordController: _passwordController,
          ),
          ConnectButton(
            validateEmail: _validateEmail,
            emailController: _emailController,
            validatePassword: _validatePassword,
            passwordController: _passwordController,
            setEmailErrorMessage: _setEmailErrorMessage,
          ),
          ForgotPasswordLink(),
          CreateNewAccountLink(),
        ],
      ),
    ),
  );
}
