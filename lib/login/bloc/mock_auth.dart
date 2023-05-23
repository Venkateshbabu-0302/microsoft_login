// class AuthService {
//   Future<String?> login({required String email, required String password}) async {
//     await Future.delayed(Duration(seconds: 2)); // Simulate a network delay
//     if (email == 'a' && password == 'a') {
//       return 'token';
//     } else {
//       throw Exception('Incorrect email or password');
//     }
//   }
// }
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  Future<String?> login({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return token;
    }else{
      throw Exception('Incorrect email or password');
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}