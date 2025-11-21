import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../database/app_database.dart';
import '../database/entities/miembro_entity.dart';

class MiembroScreen extends StatefulWidget {
  const MiembroScreen({super.key});

  @override
  State<MiembroScreen> createState() => _MiembroScreenState();
}

class _MiembroScreenState extends State<MiembroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _documentoController = TextEditingController();
  final _comunidadController = TextEditingController();
  String? _tipoCertificacion;

  Future<void> _generarCertificacion() async {
    if (!_formKey.currentState!.validate()) return;

    final db =
        await $FloorAppDatabase.databaseBuilder('wayuu.db').build();

    // Validar si el miembro existe en el censo
    final miembro =
        await db.miembroDao.findByDocumento(_documentoController.text);

    if (miembro == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El miembro NO está registrado en el censo'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Crear PDF
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'CERTIFICACIÓN COMUNIDAD WAYUU',
                style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Se certifica que:'),
              pw.SizedBox(height: 10),
              pw.Text('Nombre: ${miembro.nombre}'),
              pw.Text('Documento: ${miembro.documento}'),
              pw.Text('Comunidad: ${miembro.comunidad}'),
              pw.SizedBox(height: 10),
              pw.Text('Tipo de certificación: $_tipoCertificacion'),
              pw.SizedBox(height: 30),
              pw.Text('Emitido por la autoridad tradicional'),
            ],
          ),
        ),
      ),
    );

    // Mostrar PDF
    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miembro de la Comunidad'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _documentoController,
                decoration: const InputDecoration(
                  labelText: 'Documento',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v!.isEmpty ? 'Ingrese su documento' : null,
              ),
              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipo de certificación',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Salud', child: Text('Salud')),
                  DropdownMenuItem(value: 'Educación', child: Text('Educación')),
                  DropdownMenuItem(value: 'Policía', child: Text('Policía')),
                  DropdownMenuItem(value: 'Administrativa', child: Text('Administrativa')),
                ],
                onChanged: (value) => _tipoCertificacion = value,
                validator: (v) => v == null ? 'Seleccione un tipo' : null,
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: const Icon(Icons.picture_as_pdf),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                ),
                label: const Text(
                  "Generar Certificación PDF",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: _generarCertificacion,
              )
            ],
          ),
        ),
      ),
    );
  }
}
