import 'package:epms_tech/core/utils/json_parser.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  final String baseUrl;
  AuthRemoteDatasource({required this.baseUrl});

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse(baseUrl);
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

    if (response.statusCode == 200) {
      return await parseJsonInBackground(response.body);
    } else {
      throw Exception('Failed login: ${response.statusCode}');
    }
  }
}