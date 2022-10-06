import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_bloc_state.dart';
import 'package:convenient_architecture/src/cubits/states/bloc_events.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IActionBlocWithArg<Response, Argument, Data, Failure>
    extends Bloc<IActionArgEvent<Argument>, IActionBlocState<Data, Failure>> {
  IActionBlocWithArg({
    required FutureArgAction<Response, Argument> action,
    required StateAdapter<Response, Data, Failure> stateAdapter,
    EventTransformer<IActionArgEvent<Argument>>? transformer,
  }) : super(const IActionBlocState.initial()) {
    on<IActionArgEvent<Argument>>(
      transformer: transformer,
      (event, emit) async {
        emit(const IActionBlocState.inProgress());

        final result = await stateAdapter.convertResponseToState(
          () => action(event.argument),
        );

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
