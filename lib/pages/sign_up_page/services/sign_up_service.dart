import 'dart:convert';
import 'package:http/http.dart' as http;
import "../../../i18n/generated/strings.g.dart";

Future<String> signUpService(String username, String password) async {
  http.Response response = await http.post(
    Uri.parse("http://192.168.0.137:3001/sign-up"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"username": username, "password": password}),
  );
  switch (response.statusCode) {
    case 201:
      return t.sign_up_page.ok;
    case 401:
      return t.sign_up_page.error_labels.missing_credentials;
    case 409:
      return t.sign_up_page.error_labels.already_existing_user;
    default:
      return t.sign_up_page.error_labels.unknown_error;
  }
}
