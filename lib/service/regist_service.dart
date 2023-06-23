import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: 'https://64916ed72f2c7ee6c2c836b0.mockapi.io/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
));

class RegistrationService {
  Future<bool> register(String nama, String password, String level) async {
    try {
      // Check if the name already exists in the data
      final response = await dio.get('login?nama=$nama');

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        if (data.isEmpty) {
          // Name is not found, proceed with registration
          final registrationResponse = await dio.post('login', data: {
            'nama': nama,
            'password': password,
            'level': level,
          });

          if (registrationResponse.statusCode == 201) {
            return true; // Registration successful
          }
        }
      }

      return false; // Registration failed due to existing name
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
