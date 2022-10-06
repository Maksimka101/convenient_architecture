import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/bloc_events.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_bloc_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IVoidActionBloc<Response, Failure>
    extends Bloc<IActionEvent, IVoidActionBlocState<Failure>> {
  IVoidActionBloc({
    required FutureAction<Response> action,
    required VoidStateAdapter<Response, Failure> stateAdapter,
    EventTransformer<IActionEvent>? transformer,
  }) : super(const IVoidActionBlocState.initial()) {
    on<IActionEvent>(
      transformer: transformer,
      (_, emit) async {
        emit(const IVoidActionBlocState.inProgress());

        final result = await stateAdapter.convertResponseToState(action);

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
