import 'package:meta/meta.dart';

class Steps {
  final int steps;
  final DateTime date;
  final int year;
  final int month;
  final int day;

  Steps({
    @required this.steps,
    @required this.date,
    @required this.year,
    @required this.month,
    @required this.day
  })
    : assert(steps != null),
      assert(date != null),
      assert(year != null),
      assert(month != null),
      assert(day != null);
}