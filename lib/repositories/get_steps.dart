import 'package:health/health.dart';

class GetSteps {
  static getSteps() async {
    final DateTime today = DateTime.now();
    final healthData = await Health.getHealthDataFromType(today.subtract(new Duration(days: 1)), today, HealthDataType.STEPS);
    return healthData;
  }
}