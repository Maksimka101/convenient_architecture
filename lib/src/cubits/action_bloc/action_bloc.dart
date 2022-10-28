import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_bloc_state.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

/// Action bloc is used to automatically map `action` that returns some [Data] to the states.
///
/// It works this way:
/// - event is added
///   - action is performed
///     - before actions is performed `in progress` state is emitted
///     - when action is successfully performed `success` state with [Data] is emitted
///     - in case of failure `failure` state with the [Failure] is emitted.
abstract class IActionBloc<Event, Response, Data, Failure>
    extends Bloc<Event, IActionBlocState<Data, Failure>> {
  IActionBloc({
    required FutureArgAction<Response, Event> action,
    required IStateAdapter<Event, Response, Data, Failure> stateAdapter,
    EventTransformer<Event>? transformer,
  }) : super(const IActionBlocState.initial()) {
    on<Event>(
      transformer: transformer,
      (event, emit) async {
        emit(const IActionBlocState.inProgress());

        final result = await stateAdapter.convertResponseToState(event, action);

        emit(
          result.fold(
            IActionBlocState.failure,
            IActionBlocState.success,
          ),
        );
      },
    );
  }
}
