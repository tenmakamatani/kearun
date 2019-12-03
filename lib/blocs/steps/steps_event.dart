import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StepsEvent extends Equatable {
  StepsEvent([List props = const []])
    : super(props);
}

class StepsLoad extends StepsEvent {
  @override
  String toString() => 'StepsLoad';
}
