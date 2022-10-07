import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_bloc_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

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
            IVoidActionBlocState.failure,
            IVoidActionBlocState.success,
          ),
        );
      },
    );
  }
}
