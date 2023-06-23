// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "token";
const String USER_ID = "userID";
const String USERNAME = "username";

class UserInfo {
  Future<void> setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(TOKEN, value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future<void> setUserID(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(USER_ID, value);
  }

  Future<String> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USER_ID) ?? '';
  }

  Future<void> setUsername(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(USERNAME, value);
  }

  Future<String> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USERNAME) ?? '';
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  Future<void> clearUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(TOKEN);
    await pref.remove(USER_ID);
    await pref.remove(USERNAME);
  }

  bool isLoggedIn() {
    // Implement your logic here to check if user is logged in
    // Return true or false accordingly
    return false;
  }
}