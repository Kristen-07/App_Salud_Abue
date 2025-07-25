import 'package:flutter/material.dart';

class PressureList extends StatelessWidget {
  const PressureList({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí luego conectamos con Firebase para mostrar registros reales
    final registros = [
      {'presion': '120/80', 'glucosa': '95', 'fecha': '25/07/2025'},
      {'presion': '130/85', 'glucosa': '105', 'fecha': '24/07/2025'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Historial de presión y glucosa')),
      body: ListView.builder(
        itemCount: registros.length,
        itemBuilder: (context, index) {
          final item = registros[index];
          return ListTile(
            title: Text(
                'Presión: ${item['presion']} - Glucosa: ${item['glucosa']}'),
            subtitle: Text('Fecha: ${item['fecha']}'),
            leading: const Icon(Icons.health_and_safety),
          );
        },
      ),
    );
  }
}
