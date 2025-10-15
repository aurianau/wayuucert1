import 'package:flutter/material.dart';

class MiembroPage extends StatelessWidget {
  const MiembroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal del Miembro'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Center(
        child: Text('Aquí el miembro podrá generar su certificación.'),
      ),
    );
  }
}
