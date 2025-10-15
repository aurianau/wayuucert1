import 'package:flutter/material.dart';

class VerCensoScreen extends StatefulWidget {
  const VerCensoScreen({super.key});

  @override
  State<VerCensoScreen> createState() => _VerCensoScreenState();
}

class _VerCensoScreenState extends State<VerCensoScreen> {
  // Simulación de datos (en una app real vendrán de la BD)
  final List<Map<String, String>> miembros = [
    {
      'nombre': 'Anderson Uriana',
      'documento': '123456789',
      'comunidad': 'Puerto Caracol',
      'tipo': 'Salud'
    },
    {
      'nombre': 'Clady Mejía',
      'documento': '987654321',
      'comunidad': 'Suwunsha',
      'tipo': 'Educación'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Censo de la Comunidad'),
        backgroundColor: Colors.redAccent,
      ),
      body: miembros.isEmpty
          ? const Center(
              child: Text(
                'No hay miembros registrados aún.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: miembros.length,
              itemBuilder: (context, index) {
                final miembro = miembros[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blueAccent),
                    title: Text(
                      miembro['nombre']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Documento: ${miembro['documento']}\n'
                      'Comunidad: ${miembro['comunidad']}\n'
                      'Certificación: ${miembro['tipo']}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
