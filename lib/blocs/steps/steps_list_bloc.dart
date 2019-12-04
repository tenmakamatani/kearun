import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:kearun/blocs/steps/steps_list_event.dart';
import 'package:kearun/blocs/steps/steps_list_state.dart';
import 'package:kearun/blocs/steps/steps_list_repository.dart';

class StepsListBloc extends Bloc<StepsListEvent, StepsListState> {
  final StepsListRepository _stepsListRepository;

  StepsListBloc({
    @required StepsListRepository stepsListRepository
  })
    : assert(stepsListRepository != null),
      _stepsListRepository = stepsListRepository;
  
  @override
  StepsListState get initialState => StepsListEmpty();

  @override
  Stream<StepsListState> mapEventToState(StepsListEvent event) async* {
    if (event is StepsListLoad) {
      yield* _mapStepsListLoadToState();
    }
  }

  Stream<StepsListState> _mapStepsListLoadToState() async* {
    yield StepsListLoading();
    try {
      yield StepsListLoaded(stepsList: _stepsListRepository.read());
    } catch (_) {
      yield StepsListFailure();
    }
  }
}
