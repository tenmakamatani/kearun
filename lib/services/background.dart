import 'package:background_fetch/background_fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health/health.dart';

import 'package:kearun/databases/steps_database_provider.dart';

void setUpBackgroundTask() {
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 30
    ),
    () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final beforeDay = prefs.getInt('last_check_day') ?? 0;
      if (beforeDay != DateTime.now().day) {
        final StepsDatabaseProvider _provider = StepsDatabaseProvider();
        final db = await _provider.database;

        // Get steps data from device
        final DateTime now = DateTime.now();
        final data = await Health.getHealthDataFromType(now.subtract(Duration(days: 1)), now, HealthDataType.STEPS);
        print(data.toList());
        await db.insert('steps', {
          
        });
      }
    });
}
