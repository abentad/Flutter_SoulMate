import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String? _token = "";
  String? get token => _token;
  final _storage = const FlutterSecureStorage();
  String _username = "";
  String get username => _username;

  Future<bool> checkUserExistence() async {
    if (await _storage.read(key: 'token') != "") {
      _token = await _storage.read(key: 'token');
      var _response = await http.get(
        Uri.parse('http://10.0.2.2:3000/users/signInWithToken'),
        headers: {'Authorization': 'Bearer $_token'},
      );
      if (_response.statusCode == 200) {
        _username = jsonDecode(_response.body)['user']['userName'];
      }
      update();
      return true;
    } else {
      return false;
    }
  }

  void signOut() {
    _token = "";
    _storage.write(key: 'token', value: "");
    Get.offAllNamed('/emailSignUp');
    update();
  }

  Future<bool> authenticate(String email, String password) async {
    var _response = await http.post(
      Uri.parse('http://10.0.2.2:3000/users/signIn'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (_response.statusCode == 200) {
      _token = jsonDecode(_response.body)['token'];
      _username = jsonDecode(_response.body)['user']['userName'];
      _storage.write(key: "token", value: _token);
      update();
      return true;
    }
    return false;
  }

  Future<bool> signUpUser(String username, String email, String password) async {
    var _response = await http.post(
      Uri.parse('http://10.0.2.2:3000/users/signUp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password, "userName": username}),
    );
    if (_response.statusCode == 200) {
      _token = jsonDecode(_response.body)['token'];
      _username = jsonDecode(_response.body)['user']['userName'];
      _storage.write(key: "token", value: _token);
      update();
      return true;
    }
    return false;
  }
}
