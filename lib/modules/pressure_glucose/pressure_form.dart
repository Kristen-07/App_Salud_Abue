import 'package:flutter/material.dart';

class PressureForm extends StatefulWidget {
  const PressureForm({super.key});

  @override
  State<PressureForm> createState() => _PressureFormState();
}

class _PressureFormState extends State<PressureForm> {
  final _formKey = GlobalKey<FormState>();
  final _pressureController = TextEditingController();
  final _glucoseController = TextEditingController();

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      final pressure = _pressureController.text;
      final glucose = _glucoseController.text;

      // Aquí luego agregamos Firebase para guardar los datos

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos guardados exitosamente')),
      );

      _pressureController.clear();
      _glucoseController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar presión y glucosa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _pressureController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Presión arterial'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese la presión' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _glucoseController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Glucosa'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese la glucosa' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveData,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
