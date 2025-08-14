import 'dart:convert';

import 'package:epms_tech/domain/repository/auth_repository.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImpl implements AuthRepository{
  final String baseUrl;

  AuthRepositoryImpl({required this.baseUrl});
  
  @override
  Future<bool> login(String username, String password) async {
    print('B URL  == $baseUrl, u= $username, p= $password');
    final url = Uri.parse(baseUrl);
    print('URL == $url');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        "user_login": username,
        'password': password,
        'last_login_date': '',
        'last_login_time': '',
        'imei': '',
        'is_empty' : '1'
      },
    );

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'] == true;
    } else {
      print('API error = $response');
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}