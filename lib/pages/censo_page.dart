import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../database/entities/miembro_entity.dart';
import '../screens/miembro_screen.dart';

class CensoPage extends StatefulWidget {
  const CensoPage({super.key});

  @override
  State<CensoPage> createState() => _CensoPageState();
}

class _CensoPageState extends State<CensoPage> {
  List<Miembro> miembros = [];

  @override
  void initState() {
    super.initState();
    cargarCenso();
  }

  Future<void> cargarCenso() async {
    final db = await $FloorAppDatabase.databaseBuilder('wayuu.db').build();
    final lista = await db.miembroDao.findAllMiembros();

    setState(() {
      miembros = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Censo de la Comunidad"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: miembros.length,
        itemBuilder: (context, i) {
          final m = miembros[i];
          return Card(
            child: ListTile(
              title: Text(m.nombre),
              subtitle: Text("Documento: ${m.documento}\nComunidad: ${m.comunidad}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MiembroScreen()),
          );
          cargarCenso();
        },
      ),
    );
  }
}
