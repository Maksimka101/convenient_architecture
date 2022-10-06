import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_bloc_state.dart';
import 'package:convenient_architecture/src/cubits/states/bloc_events.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IActionBloc<Response, Data, Failure>
    extends Bloc<ActionBlocEvent, IActionBlocState<Data, Failure>> {
  IActionBloc({
    required this.action,
    required this.stateAdapter,
    EventTransformer<ActionBlocEvent>? transformer,
  }) : super(const IActionBlocState.initial()) {
    on<ActionBlocEvent>(
      transformer: transformer,
      (_, emit) async {
        emit(const IActionBlocState.inProgress());

        final result = await stateAdapter.convertResponseToState(action);

        emit(
          result.fold(
            IActionBlocState.failure,
            IActionBlocState.success,
          ),
        );
      },
    );
  }

  final FutureAction<Response> action;
  final StateAdapter<Response, Data, Failure> stateAdapter;

  void doAction() => add(const ActionBlocEvent());
}
