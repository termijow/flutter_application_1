import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/users',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  bool _isPasswordVisible = true;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void login() {
    debugPrint('El email es: ${email.text}');
    debugPrint('La contrasena es: ${password.text}');
  }

  Future<void> getUser() async {
    try {
      final response = await _dio.get('/users');
      if (response.statusCode == 200) {
        debugPrint('Usuarios obtenidos: ${response.data.length}');
      }
    } catch (e) {
      debugPrint('Error obteniendo usuarios: $e');
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
