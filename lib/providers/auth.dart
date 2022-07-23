import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  get returnSecureToken => null;

  Future<void> signup(String email, String password) async {
    Uri url = Uri.https(
      "identitytoolkit.googleapis.com",
      "/v1/accounts:signUp",
      {
        "key": "AIzaSyDJGzllhk4U8aIe2C3TDdr0Y_foWprSAMM",
      },
    );
    final response = await http.post(url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(email);
    print(password);
    print(json.decode(response.body));
  }
}
