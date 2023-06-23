import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://64916ed72f2c7ee6c2c836b0.mockapi.io';
  bool isLoggedIn = false;

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.get(Uri.parse('$baseUrl/login'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      final userData = responseData.firstWhere(
        (data) => data['nama'] == username && data['password'] == password,
        orElse: () => null,
      );

      if (userData != null) {
        isLoggedIn = true;
        return userData;
      } else {
        throw Exception('Username atau password tidak valid');
      }
    } else {
      throw Exception('Gagal melakukan login');
    }
  }
}
