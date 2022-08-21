import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_cubit_state.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IActionCubitWithArg<Response, Argument, Data, Failure>
    extends Cubit<IActionCubitState<Data, Failure>> {
  IActionCubitWithArg({
    required this.action,
    required this.stateAdapter,
  }) : super(const IActionCubitState.initial());

  final FutureArgAction<Response, Argument> action;
  final StateAdapter<Response, Data, Failure> stateAdapter;

  Future<void> doAction(Argument argument) async {
    emit(const IActionCubitState.inProgress());

    final result =
        await stateAdapter.convertResponseToState(() => action(argument));

    emit(
      result.fold(
        IActionCubitState.failure,
        IActionCubitState.success,
      ),
    );
  }
}
