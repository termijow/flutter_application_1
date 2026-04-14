import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void login() {
    debugPrint('El email es: ${email.text}');
    debugPrint('La contrasena es: ${password.text}');
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
