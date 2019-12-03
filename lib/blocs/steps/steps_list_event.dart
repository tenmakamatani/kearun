import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StepsListEvent extends Equatable {
  StepsListEvent([List props = const []])
    : super(props);
}

class StepsListLoad extends StepsListEvent {
  @override
  String toString() => 'StepsListLoad';
}
