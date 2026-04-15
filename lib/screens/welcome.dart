import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.login);
              },
              child: const Text('Iniciar Sesion'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.register);
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
