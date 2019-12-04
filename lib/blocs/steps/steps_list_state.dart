import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:kearun/models/steps.dart';

@immutable
abstract class StepsListState extends Equatable {
  StepsListState([List props = const []])
    : super(props);
}

class StepsListEmpty extends StepsListState {
  @override
  String toString() => 'StepsListEmpty';
}

class StepsListLoading extends StepsListState {
  @override
  String toString() => 'StepsListLoading';
}

class StepsListLoaded extends StepsListState {
  final Stream<List<Steps>> stepsList;

  StepsListLoaded({
    @required this.stepsList
  })
    : assert(stepsList != null),
      super([stepsList]);
  
  @override
  String toString() => 'StepsListLoaded';
}

class StepsListFailure extends StepsListState {
  @override
  String toString() => 'StepsListFailure';
}
