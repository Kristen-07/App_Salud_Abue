import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _iniciarSesion() async {
    String usuario = _usuarioController.text.trim();
    String contrasena = _passwordController.text.trim();

    if (usuario.isEmpty || contrasena.isEmpty) {
      _mostrarMensaje("Por favor llena todos los campos");
      return;
    }

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('usuario', isEqualTo: usuario)
          .get();

      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.first.data() as Map<String, dynamic>;

        // 🔧 Aquí estaba el problema (campo 'contraseña' con ñ)
        if (data['contraseña'] == contrasena) {
          _mostrarMensaje("Inicio de sesión exitoso ✅");
          // Puedes redirigir a otra página aquí
        } else {
          _mostrarMensaje("Contraseña incorrecta ❌");
        }
      } else {
        _mostrarMensaje("Usuario no encontrado ❌");
      }
    } catch (e) {
      _mostrarMensaje("Error al iniciar sesión: $e");
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Bienvenida de nuevo',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Inicia sesión para continuar',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 32),

                // Campo Usuario
                _CustomInputField(
                  label: 'Usuario',
                  controller: _usuarioController,
                ),

                const SizedBox(height: 16),

                // Campo Contraseña
                _CustomInputField(
                  label: 'Contraseña',
                  controller: _passwordController,
                  obscureText: true,
                ),

                const SizedBox(height: 32),

                // Botón Iniciar Sesión
                ElevatedButton(
                  onPressed: _iniciarSesion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8B7E4),
                    foregroundColor: const Color(0xFF2C3E50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 16),
                    elevation: 2,
                  ),
                  child: Text(
                    'Iniciar Sesión',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 20),

                // Botón para ir al registro
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    '¿No tienes cuenta? Regístrate aquí',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFE8B7E4),
                      fontWeight: FontWeight.w600,
                    ),
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

class _CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const _CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: GoogleFonts.poppins(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: const Color(0xFF2C3E50)),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE8B7E4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE8B7E4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF4A90E2)),
        ),
      ),
    );
  }
}
