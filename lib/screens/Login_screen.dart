import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Login_provider.dart';
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
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();

    return Scaffold(
      body: Center(
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

              SizedBox(height: 20),

              // TITULO
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

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
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      style: TextStyle(color: Colors.blue),
                      cursorColor: Colors.blue,
                    ),

                    SizedBox(height: 10),

                    // CONTRASEÑA
                    TextFormField(
                      controller: provider.password,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'El campo es requerido';
                        }
                        if (value.trim().length <= 8) {
                          return 'La contraseña debe debe de ser mayor a 8 caracteres';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            Text('Contraseña'),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      style: TextStyle(color: Colors.blue),
                      cursorColor: Colors.blue,
                    ),

                    SizedBox(height: 20),

                    // BOTON
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Los campos son correctos');
                          provider.login();
                        }
                      },
                      child: Text('Iniciar sesion'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}