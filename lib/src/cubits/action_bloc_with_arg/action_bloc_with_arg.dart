import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_bloc_state.dart';
import 'package:convenient_architecture/src/cubits/states/bloc_events.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IActionBlocWithArg<Response, Argument, Data, Failure>
    extends Bloc<ActionArgBlocEvent<Argument>,
        IActionBlocState<Data, Failure>> {
  IActionBlocWithArg({
    required this.action,
    required this.stateAdapter,
    EventTransformer<ActionArgBlocEvent<Argument>>? transformer,
  }) : super(const IActionBlocState.initial()) {
    on<ActionArgBlocEvent<Argument>>(
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

  final FutureArgAction<Response, Argument> action;
  final StateAdapter<Response, Data, Failure> stateAdapter;

  void doAction(Argument argument) => add(ActionArgBlocEvent(argument));
}
