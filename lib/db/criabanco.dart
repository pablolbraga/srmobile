import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CriaBanco {
  // Construtor com acesso privado
  CriaBanco._();

  // Criar uma instancia de CriaBanco
  static final CriaBanco instance = CriaBanco._();

  // Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    } else {
      return await _initDatabase();
    }
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), "srmobile.db"),
        version: 1, onCreate: _onCreate);
  }

  _onCreate(db, versao) async {}
}
