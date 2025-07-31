import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final String nombreUsuario;

  const HomePage({super.key, required this.nombreUsuario});

  @override
  Widget build(BuildContext context) {
    final String fechaActual =
        DateFormat('EEEE, d MMMM y', 'es_ES').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saludo y fecha
              Text(
                'Hola, $nombreUsuario 👋',
                style: GoogleFonts.nunito(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                fechaActual,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 20),

              // Frase motivacional
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8B7E4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '✨ Un día a la vez, cuida de ti 💕',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tarjetas de resumen
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _resumenCard(Icons.favorite, 'Presión', '120/80'),
                    _resumenCard(Icons.bloodtype, 'Glucosa', '95 mg/dL'),
                    _resumenCard(Icons.medication, 'Medicina', '8:00 PM'),
                    _resumenCard(Icons.calendar_today, 'Cita', '5 Ago'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Accesos rápidos
              Text(
                'Accesos rápidos',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _accesoBoton(
                      context, Icons.monitor_heart, 'Presión', '/pressure'),
                  _accesoBoton(context, Icons.medication, 'Medicamentos',
                      '/medications'),
                  _accesoBoton(context, Icons.notes, 'Notas', '/notes'),
                  _accesoBoton(
                      context, Icons.calendar_month, 'Citas', '/appointments'),
                  _accesoBoton(context, Icons.person, 'Perfil', '/profile'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para tarjeta de resumen
  Widget _resumenCard(IconData icon, String titulo, String valor) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF7FB77E), size: 28),
          const SizedBox(height: 8),
          Text(
            titulo,
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            valor,
            style: GoogleFonts.nunito(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Widget para botón de acceso rápido
  Widget _accesoBoton(
      BuildContext context, IconData icon, String texto, String ruta) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFE8B7E4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 6),
            Text(
              texto,
              style: GoogleFonts.nunito(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
