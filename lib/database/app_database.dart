import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/miembro_dao.dart';
import 'entities/miembro_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Miembro])
abstract class AppDatabase extends FloorDatabase {
  MiembroDao get miembroDao;
}
