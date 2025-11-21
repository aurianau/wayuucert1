import 'package:floor/floor.dart';
import '../entities/miembro_entity.dart';

@dao
abstract class MiembroDao {
  @insert
  Future<void> insertMiembro(Miembro miembro);

  @Query('SELECT * FROM Miembro')
  Future<List<Miembro>> getAllMiembros();

  @Query('SELECT * FROM Miembro WHERE documento = :doc LIMIT 1')
  Future<Miembro?> findByDocumento(String doc);
}
