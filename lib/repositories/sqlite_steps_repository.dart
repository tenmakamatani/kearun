import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'package:kearun/models/steps.dart';
import 'package:kearun/blocs/steps/steps_repository.dart';
import 'package:kearun/databases/steps_database_provider.dart';

class SqliteStepsRepository extends StepsRepository {
  // Create provider
  final StepsDatabaseProvider _provider = StepsDatabaseProvider();

  @override
  Stream<List<Steps>> read() async* {
    final Database db = await _provider.database;
    final steps = await db.query('steps');
    yield steps.map((step) => Steps.fromMap(step));
  }
}
