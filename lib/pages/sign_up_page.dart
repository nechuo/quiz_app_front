import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './sign_in_page.dart';
import 'forgot_password_page/forgot_password_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _passwordErrorMessage;
  String? _confirmPasswordErrorMessage;
  String? _emailErrorMessage;

  Future<String> _signUp(String username, String password) async {
    http.Response response = await http.post(
      Uri.parse("http://192.168.0.137:3001/sign-up"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );
    switch (response.statusCode) {
      case 201:
        return "Ok";
      case 401:
        return "Informations manquantes";
      case 409:
        return "Un.e utilisateur.ice avec ce nom d'utilisateur existe deja.";
      default:
        return "Une erreur inconnue s'est produite.";
    }
  }

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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0),
              child: Text(
                'Welcome to Quiz App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Text(
                'Sign Up to continue',
                style: TextStyle(fontSize: 19),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: _emailErrorMessage,
                ),
                onChanged: (text) {
                  setState(() {
                    _emailErrorMessage = null;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
              child: TextField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  errorText: _passwordErrorMessage,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    _passwordErrorMessage = null;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: !_confirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm your password',
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  errorText: _confirmPasswordErrorMessage,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    _confirmPasswordErrorMessage = null;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    bool isValidConfirmPassword =
                        _validateConfirmPassword() == null;
                    bool isValidUsername = _validateEmail() == null;
                    bool isValidPassword = _validatePassword() == null;

                    if (!isValidPassword ||
                        !isValidUsername ||
                        !isValidConfirmPassword) {
                      return;
                    }

                    final navigator = Navigator.of(context);

                    String message = await _signUp(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (message == "Ok") {
                      navigator.push(
                        MaterialPageRoute(builder: (_) => SignInPage()),
                      );
                    } else {
                      setState(() {
                        _emailErrorMessage = message;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 157, 110, 237),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                  ),
                  child: Text('Sign Up  '),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 157, 110, 237),
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(
                            title: 'Forgot Password',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 157, 110, 237),
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
