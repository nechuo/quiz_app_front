import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './sign_up_page.dart';
import './home_page.dart';
import './forgot_password_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _passwordErrorMessage;
  String? _emailErrorMessage;

  Future<String> _signIn(String username, String password) async {
    http.Response response = await http.post(
      Uri.parse("http://192.168.0.137:3001/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );
    switch (response.statusCode) {
      case 200:
        return "Ok";
      case 401:
        return "Informations manquantes";
      case 404:
        return "Compte introuvable";
      case 403:
        return "Mot de passe incorect";
      default:
        return "Une erreur inconnue s'est produite.";
    }
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
                'Sign In to continue',
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
                onChanged: (text) {},
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
                onChanged: (text) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    bool isValidUsername = _validateEmail() == null;
                    bool isValidPassword = _validatePassword() == null;
                    if (!isValidPassword || !isValidUsername) {
                      return;
                    }

                    final navigator = Navigator.of(context);

                    String message = await _signIn(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (message == "Ok") {
                      navigator.push(
                        MaterialPageRoute(builder: (_) => HomePage()),
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
                  child: Text('Login'),
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
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Sign Up',
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
                          builder: (context) =>
                              const SignUpPage(title: 'Sign Up'),
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
