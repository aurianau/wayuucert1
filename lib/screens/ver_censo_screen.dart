import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../database/entities/miembro_entity.dart';

class VerCensoScreen extends StatefulWidget {
  const VerCensoScreen({super.key});

  @override
  State<VerCensoScreen> createState() => _VerCensoScreenState();
}

class _VerCensoScreenState extends State<VerCensoScreen> {
  List<Miembro> _miembros = [];

  @override
  void initState() {
    super.initState();
    _cargarMiembros();
  }

  Future<void> _cargarMiembros() async {
    final db = await $FloorAppDatabase.databaseBuilder('wayuu.db').build();
    final lista = await db.miembroDao.getAllMiembros();

    setState(() => _miembros = lista);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Censo de Miembros'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _miembros.isEmpty
          ? const Center(
              child: Text(
                "No hay miembros registrados",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _miembros.length,
              itemBuilder: (context, index) {
                final m = _miembros[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(m.nombre),
                  subtitle: Text("Documento: ${m.documento}\nComunidad: ${m.comunidad}"),
                );
              },
            ),
    );
  }
}
