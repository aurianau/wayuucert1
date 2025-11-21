import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../database/entities/miembro_entity.dart';

class RegistrarMiembroScreen extends StatefulWidget {
  const RegistrarMiembroScreen({super.key});

  @override
  State<RegistrarMiembroScreen> createState() => _RegistrarMiembroScreenState();
}

class _RegistrarMiembroScreenState extends State<RegistrarMiembroScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _comunidadController = TextEditingController();

  Future<void> _guardarMiembro() async {
    if (_formKey.currentState!.validate()) {
      final db = await $FloorAppDatabase.databaseBuilder('wayuu.db').build();

      final miembro = Miembro(
        nombre: _nombreController.text,
        documento: _documentoController.text,
        comunidad: _comunidadController.text,
      );

      await db.miembroDao.insertMiembro(miembro);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Miembro guardado correctamente"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Miembro"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Ingrese el nombre" : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _documentoController,
                decoration: const InputDecoration(
                  labelText: "Documento",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Ingrese el documento" : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _comunidadController,
                decoration: const InputDecoration(
                  labelText: "Comunidad",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Ingrese la comunidad" : null,
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: _guardarMiembro,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Guardar Miembro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
