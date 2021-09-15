import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String _token = "";
  String get token => _token;

  Future<bool> authenticate(String email, String password) async {
    var response = await http.post(
      Uri.parse('http://10.0.2.2:3000/users/signIn'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      _token = jsonDecode(response.body)['token'];
      update();
      return true;
    }
    return false;
  }
}
