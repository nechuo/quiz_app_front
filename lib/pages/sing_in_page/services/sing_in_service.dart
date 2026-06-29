import 'dart:convert';
import 'package:http/http.dart' as http;
import "../../../i18n/generated/strings.g.dart";

Future<String> signIn(String username, String password) async {
  http.Response response = await http.post(
    Uri.parse("http://192.168.0.137:3001/login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"username": username, "password": password}),
  );
  switch (response.statusCode) {
    case 200:
      return t.sing_in_page.ok;
    case 401:
      return t.sing_in_page.error_labels.missing_credentials;
    case 404:
      return t.sing_in_page.error_labels.missing_account;
    case 403:
      return t.sing_in_page.error_labels.incorrect_password;
    default:
      return t.sing_in_page.error_labels.unknown_error;
  }
}
