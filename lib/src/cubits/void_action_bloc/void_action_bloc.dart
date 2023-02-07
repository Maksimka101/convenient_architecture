import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_bloc_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

/// Void action bloc is used to automatically map `action` that doesn't return any value to the states.
///
/// It works this way:
/// - event is added
///   - action is performed
///     - before actions is performed `in progress` state is emitted
///     - when action is successfully performed `success` state is emitted
///     - in case of failure `failure` state with the [Failure] is emitted.
abstract class IVoidActionBloc<Event, Response, Failure>
    extends Bloc<Event, IVoidActionBlocState<Failure>> {
  IVoidActionBloc({
    required FutureArgAction<Response, Event> action,
    required IVoidStateAdapter<Event, Response, Failure> stateAdapter,
    EventTransformer<Event>? transformer,
  }) : super(const IVoidActionBlocState.initial()) {
    on<Event>(
      transformer: transformer,
      (event, emit) async {
        emit(const IVoidActionBlocState.inProgress());

        final result = await stateAdapter.convertResponseToState(event, action);

        emit(
          result.match(
            IVoidActionBlocState.success,
            IVoidActionBlocState.failure,
          ),
        );
      },
    );
  }
}
