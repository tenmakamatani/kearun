import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseProvider {
  Database _instance;

  String get databaseName;
  String get tableName;

  // Return database instance
  Future<Database> get database async {
    if (_instance == null) {
      _instance = await openDatabase(
        join(
          await getDatabasesPath(),
          databaseName,
        ),
        onCreate: createDatabase,
        version: 1,
      );
    }
    return _instance;
  }

  // Create database if not exist
  createDatabase(Database db, int version);
}
