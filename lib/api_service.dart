import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  final String url =
      "https://69e5132ccfa9394db8daae87.mockapi.io/Login";

  // LOGIN
  Future<bool> login(String username, String password) async {
    try {
      final response = await dio.get(url);
      List users = response.data;

      for (var user in users) {
        if (user['username'] == username.trim() &&
            user['password'] == password.trim()) {
          return true;
        }
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // SIGN UP
  Future<bool> signup(
      String username, String email, String password) async {
    try {
      await dio.post(url, data: {
        "username": username,
        "email": email,
        "password": password,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}