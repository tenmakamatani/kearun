import 'package:sqflite/sqflite.dart';

import 'package:kearun/databases/database_provider.dart';

class StepsDatabaseProvider extends DatabaseProvider {
  @override
  String get databaseName => 'kearun';

  @override
  String get tableName => 'steps';

  @override
  createDatabase(Database db, int version) {
    db.execute(
      """
        CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          steps INTEGER,
          year INTEGER,
          month INTEGER,
          day INTEGER
        )
      """
    );
  }
}
