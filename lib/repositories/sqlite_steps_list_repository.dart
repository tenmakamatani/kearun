import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'package:kearun/models/steps.dart';
import 'package:kearun/blocs/steps/steps_list_repository.dart';
import 'package:kearun/databases/steps_database_provider.dart';

class SqliteStepsListRepository extends StepsListRepository {
  // Create provider
  final StepsDatabaseProvider _provider = StepsDatabaseProvider();

  @override
  Stream<List<Steps>> read() async* {
    final Database db = await _provider.database;
    final stepsList = await db.query('steps');
    final List<Steps> stepsObjects = stepsList.map((steps) {
      return Steps.fromMap(steps);
    }).toList();
    yield stepsObjects;
  }

  @override
  Future<void> create(Steps steps) async {
    final Database db = await _provider.database;
    try {
      await db.insert('steps', steps.toMap());
    } catch (_) {
      print(_);
    }
  }
}
