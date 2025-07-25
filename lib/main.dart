import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tita App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const FirebaseCheckPage(),
    );
  }
}

class FirebaseCheckPage extends StatelessWidget {
  const FirebaseCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conexión Firebase'),
      ),
      body: const Center(
        child: Text(
          '✅ Firebase conectado correctamente.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
