import 'package:flutter/material.dart';

class RegistrarMiembroScreen extends StatefulWidget {
  const RegistrarMiembroScreen({super.key});

  @override
  State<RegistrarMiembroScreen> createState() => _RegistrarMiembroScreenState();
}

class _RegistrarMiembroScreenState extends State<RegistrarMiembroScreen> {
  // Controladores de los campos
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController documentoController = TextEditingController();
  final TextEditingController comunidadController = TextEditingController();

  String tipoCertificacion = 'Salud'; // valor inicial

  // Simulación de guardado (a futuro será BD)
  void guardarMiembro() {
    String nombre = nombreController.text;
    String documento = documentoController.text;
    String comunidad = comunidadController.text;

    if (nombre.isEmpty || documento.isEmpty || comunidad.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Miembro "$nombre" registrado correctamente ✅')),
    );

    // Limpiar los campos
    nombreController.clear();
    documentoController.clear();
    comunidadController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Miembro'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Complete la información del miembro:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: documentoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de documento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: comunidadController,
              decoration: const InputDecoration(
                labelText: 'Comunidad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: tipoCertificacion,
              decoration: const InputDecoration(
                labelText: 'Tipo de certificación',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Salud', child: Text('Salud')),
                DropdownMenuItem(value: 'Educación', child: Text('Educación')),
                DropdownMenuItem(value: 'Policía', child: Text('Policía')),
                DropdownMenuItem(value: 'Administrativo', child: Text('Administrativo')),
              ],
              onChanged: (valor) {
                setState(() {
                  tipoCertificacion = valor!;
                });
              },
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                icon: const Icon(Icons.save),
                label: const Text(
                  'Guardar Registro',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: guardarMiembro,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
