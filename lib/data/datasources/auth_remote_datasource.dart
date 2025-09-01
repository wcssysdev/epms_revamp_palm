import 'dart:async';
import 'dart:convert';

import 'package:epms_tech/core/utils/json_parser.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  final String baseUrl;
  AuthRemoteDatasource({required this.baseUrl});

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse(baseUrl + '/auth/login');
    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: {
              "user_login": username,
              'password': password,
              'last_login_date': '',
              'last_login_time': '',
              'imei': '',
              'is_empty': '1',
            },
          )
          .timeout(Duration(seconds: 4));

      if (response.statusCode == 200) {
        return await parseJsonInBackground(response.body);
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final errorMsg = body['message'] ?? 'Invalid credentials';
        throw Exception('Login Failed: $errorMsg');
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('Login Failed: Connection timed out!');
    } on http.ClientException {
      throw Exception('Login Failed: Cannot reach server!');
    } catch (e) {
      // biar error dari atas (Invalid Role, Invalid credentials, dll) gak ketimpa
      rethrow;
    }
  }
}
