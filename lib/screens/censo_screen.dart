import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../database/entities/miembro_entity.dart';

class CensoScreen extends StatefulWidget {
  const CensoScreen({super.key});

  @override
  State<CensoScreen> createState() => _CensoScreenState();
}

class _CensoScreenState extends State<CensoScreen> {
  late Future<List<Miembro>> _miembrosFuture;

  @override
  void initState() {
    super.initState();
    _cargarMiembros();
  }

  void _cargarMiembros() {
    setState(() {
      _miembrosFuture = _obtenerMiembros();
    });
  }

  Future<List<Miembro>> _obtenerMiembros() async {
    final db = await $FloorAppDatabase.databaseBuilder('wayuu.db').build();
    return await db.miembroDao.findAllMiembros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Censo de la Comunidad"),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List<Miembro>>(
        future: _miembrosFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final miembros = snapshot.data!;

          if (miembros.isEmpty) {
            return const Center(
              child: Text("No hay miembros registrados."),
            );
          }

          return ListView.builder(
            itemCount: miembros.length,
            itemBuilder: (context, index) {
              final m = miembros[index];
              return ListTile(
                leading: const Icon(Icons.person, color: Colors.green),
                title: Text(m.nombre),
                subtitle: Text("Documento: ${m.documento}\nComunidad: ${m.comunidad}"),
              );
            },
          );
        },
      ),

      // BOTÓN FLOTANTE (+)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, '/miembro');
          _cargarMiembros(); // refresca la lista al volver
        },
      ),
    );
  }
}
