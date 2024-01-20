import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDB {
  static Database? _dbInstance;

  // Singleton pattern for database instance
  static Future<Database> get database async {
    if (_dbInstance == null || !_isDatabaseInitialized()) {
      _dbInstance = await _initDB();
    }
    return _dbInstance!;
  }

  static bool _isDatabaseInitialized() {
    return _dbInstance != null && _dbInstance!.isOpen;
  }

  static Future<Database> _initDB() async {
    String path = join(
      (await getApplicationDocumentsDirectory()).path,
      'database.db',
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {},
      onUpgrade: _onUpgrade,
    );
  }

  static void _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // if (oldVersion < 2) {}
  }

  static void close() {
    _dbInstance?.close();
  }

  //* create *******************************************************************

  //* read *********************************************************************

  //* update *******************************************************************

  //* delete *******************************************************************
}
