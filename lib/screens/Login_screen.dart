import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Login_provider.dart';
import 'package:flutter_application_1/utils/app_routes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen._({super.key});

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      builder: (_, __) => const LoginScreen._(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Llamada HTTP usando Dio desde initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginProvider>().getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Usamos watch para reaccionar a cambios en obscureText
    final provider = context.watch<LoginProvider>();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LOGO
                Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 120,
                ),

                const SizedBox(height: 20),

                // TITULO
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // FORMULARIO
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // CORREO
                      TextFormField(
                        controller: provider.email,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El campo es requerido';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Correo',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.blue,
                      ),

                      const SizedBox(height: 10),

                      // CONTRASEÑA
                      TextFormField(
                        controller: provider.password,
                        obscureText: provider.isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El campo es requerido';
                          }
                          if (value.trim().length < 8) {
                            return 'La contraseña debe tener al menos 8 caracteres';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          suffixIcon: IconButton(
                            icon: Icon(
                              provider.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () => provider.togglePasswordVisibility(),
                          ),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.blue,
                      ),

                      const SizedBox(height: 20),

                      // BOTON
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint('Los campos son correctos');
                            provider.login();
                            // Navegación hacia AppRoutes.home
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.home,
                              (route) => false,
                            );
                          }
                        },
                        child: const Text('Iniciar sesión'),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
