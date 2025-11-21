import 'package:floor/floor.dart';

@entity
class Miembro {
  @primaryKey
  final int? id;

  final String nombre;
  final String documento;
  final String comunidad;

  Miembro({
    this.id,
    required this.nombre,
    required this.documento,
    required this.comunidad,
  });
}
