import 'package:meta/meta.dart';

@immutable
class Steps {
  final int steps;
  final int year;
  final int month;
  final int day;

  Steps({
    @required this.steps,
    @required this.year,
    @required this.month,
    @required this.day
  })
    : assert(steps != null),
      assert(year != null),
      assert(month != null),
      assert(day != null);
  
  factory Steps.fromMap(Map<String, dynamic> map) {
    return Steps(
      steps: map['steps'],
      year: map['year'],
      month: map['month'],
      day: map['day']
    );
  }

  Object toMap() {
    return {
      steps: this.steps,
      year: this.year,
      month: this.month,
      day: this.day
    };
  }
}
