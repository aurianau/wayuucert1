import 'package:flutter/material.dart';
import '../screens/miembro_screen.dart';
import '../screens/lider_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'WAYUUCERT',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
// Mensaje de bienvenida
              const Text(
                'Bienvenidos al aplicativo WayuuCert,\n'
                'una herramienta digital que permite actualizar\n'
                'el censo de tu comunidad y expedir certificaciones\n'
                'para trámites institucionales de salud, educación y más.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),
              // BOTÓN LÍDER
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.manage_accounts),
                label: const Text('Líder de Comunidad'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LiderScreen()),
                  );
                },
              ),

              const SizedBox(height: 20),

              // BOTÓN MIEMBRO
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.people),
                label: const Text(
                  'Miembro de la Comunidad',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MiembroScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
