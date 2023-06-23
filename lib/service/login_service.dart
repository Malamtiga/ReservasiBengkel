import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:klinikapp/login.dart';
import '../../model/login.dart';

class LogoutService {
  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

class LoginService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://64916ed72f2c7ee6c2c836b0.mockapi.io/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  Future<bool> login(String nama, String password) async {
    try {
      final response = await dio.get('login', queryParameters: {
        'nama': nama,
      });

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;

        if (responseData.isNotEmpty) {
          final loginData = Login.fromJson(responseData[0]);

          if (loginData.password == password) {
            return true;
          }
        }
      }

      throw Exception('Username atau password tidak valid.');
    } catch (e) {
      print("Error: $e");
      throw Exception('Terjadi kesalahan saat login.');
    }
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<String?> getLevel(String nama) async {
    try {
      final response = await dio.get('users', queryParameters: {
        'nama': nama,
      });

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;

        if (responseData.isNotEmpty) {
          final userData = Login.fromJson(responseData[0]);
          return userData.level;
        }
      }

      return ''; // Return an empty string if the level is not found
    } catch (e) {
      print("Error: $e");
      return '';
    }
  }
}

void logout(BuildContext context) {
  LogoutService().clearUserData();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
    (Route<dynamic> route) => false,
  );
}
