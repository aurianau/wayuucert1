import 'package:flutter/material.dart';
import 'registrar_miembro_screen.dart';
import 'ver_censo_screen.dart';

class LiderScreen extends StatelessWidget {
  const LiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Líder de Comunidad',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    minimumSize: const Size(double.infinity, 50),
  ),
  icon: const Icon(Icons.person_add),
  label: const Text(
    'Registrar Miembro',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrarMiembroScreen()),
    );
  },
),

            const SizedBox(height: 20),
            ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent,
    minimumSize: const Size(double.infinity, 50),
  ),
  icon: const Icon(Icons.list),
  label: const Text(
    'Ver Censo',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VerCensoScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
