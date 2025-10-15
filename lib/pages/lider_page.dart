import 'package:flutter/material.dart';

class LiderPage extends StatelessWidget {
  const LiderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel del Líder'),
        backgroundColor: Colors.redAccent,
      ),
      body: const Center(
        child: Text('Aquí irá el registro y actualización del censo.'),
      ),
    );
  }
}
