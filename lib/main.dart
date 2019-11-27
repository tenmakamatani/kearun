import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:kearun/databases/steps_database_provider.dart';

void main() => runApp(MaterialApp(
  title: 'test',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Test')
    ),
    body: HealthWidget()
  )
));

class HealthWidget extends StatelessWidget {

  fetchData() async {
    StepsDatabaseProvider provider = StepsDatabaseProvider();
    Database database = await provider.database;
    final data = await database.rawQuery('SELECT * FROM steps');
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Push!'),
        onPressed: fetchData,
      ),
    );
  }
}