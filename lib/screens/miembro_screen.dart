import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Container(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    'CERTIFICACIÓN COMUNIDAD WAYUU',
                    style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Se certifica que:', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 8),
                pw.Text('Nombre: ${_nombreController.text}', style: pw.TextStyle(fontSize: 14)),
                pw.Text('Documento: ${_documentoController.text}', style: pw.TextStyle(fontSize: 14)),
                pw.Text('Comunidad: ${_comunidadController.text}', style: pw.TextStyle(fontSize: 14)),
                pw.SizedBox(height: 10),
                pw.Text('Tipo de certificación: $_tipoCertificacion', style: pw.TextStyle(fontSize: 14)),
                pw.SizedBox(height: 30),
                pw.Text('Emitido por: Dirección de Asuntos Indígenas', style: pw.TextStyle(fontSize: 14)),
                pw.SizedBox(height: 10),
                pw.Text('Fecha de emisión: ${DateTime.now().toLocal()}'),
              ],
            ),
          ),
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miembro de la Comunidad'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Generar Certificación',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Ingrese su nombre' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _documentoController,
                decoration: const InputDecoration(
                  labelText: 'Número de documento',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Ingrese su documento' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _comunidadController,
                decoration: const InputDecoration(
                  labelText: 'Comunidad',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Ingrese su comunidad' : null,
              ),
              const SizedBox(height: 12),
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
                onChanged: (value) => setState(() => _tipoCertificacion = value),
                validator: (value) => value == null ? 'Seleccione un tipo' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text(
                  'Generar Certificación PDF',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: _generarCertificacion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

