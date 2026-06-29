import 'package:flutter/material.dart';
import 'package:quiz_app_front/widgets/welcome_label.dart';
import 'package:quiz_app_front/pages/sign_up_page/widgets/email_field.dart';
import 'package:quiz_app_front/pages/sign_up_page/widgets/sign_up_label.dart';
import 'package:quiz_app_front/pages/sign_up_page/widgets/password_field.dart';
import 'package:quiz_app_front/pages/sign_up_page/widgets/create_account_button.dart';
import 'package:quiz_app_front/pages/sign_up_page/widgets/confirm_password_field.dart';
import 'package:quiz_app_front/pages/sign_up_page/widgets/already_have_account_link.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _passwordErrorMessage;
  String? _confirmPasswordErrorMessage;
  String? _emailErrorMessage;

  String? _validateConfirmPassword() {
    String? message;
    if (_passwordController.text != _confirmPasswordController.text) {
      message = 'Passwords do not match';
      setState(() {
        _confirmPasswordErrorMessage = message;
      });
      if (_passwordController.text.isEmpty ||
          _confirmPasswordController.text.isEmpty) {
        message = 'Password fields cannot be empty';
        setState(() {
          _confirmPasswordErrorMessage = message;
        });
      }
    } else {
      setState(() {
        _confirmPasswordErrorMessage = message;
      });
    }
    return message;
  }

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

  void _setPasswordErrorMessage(String newPasswordErrorMessage) =>
      setState(() => _passwordErrorMessage = newPasswordErrorMessage);

  void _setConfirmPasswordErrorMessage(String newConfirmPasswordErrorMessage) =>
      setState(
        () => _confirmPasswordErrorMessage = newConfirmPasswordErrorMessage,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            WelcomeLabel(),
            SignUpLabel(),
            EmailField(
              errorMessage: _emailErrorMessage,
              emailController: _emailController,
              setErrorMessage: _setEmailErrorMessage,
            ),
            PasswordField(
              errorMessage: _passwordErrorMessage,
              passwordController: _passwordController,
              setErrorMessage: _setPasswordErrorMessage,
            ),
            ConfirmPasswordField(
              errorMessage: _confirmPasswordErrorMessage,
              setErrorMessage: _setConfirmPasswordErrorMessage,
              confirmPasswordController: _confirmPasswordController,
            ),
            CreateAccountButton(
              validateEmail: _validateEmail,
              emailController: _emailController,
              validatePassword: _validatePassword,
              passwordController: _passwordController,
              setEmailErrorMessage: _setEmailErrorMessage,
              validateConfirmPassword: _validateConfirmPassword,
            ),
            AlreadyHaveAccountLink(),
          ],
        ),
      ),
    );
  }
}
