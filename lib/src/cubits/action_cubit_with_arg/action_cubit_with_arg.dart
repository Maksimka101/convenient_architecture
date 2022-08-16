import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_cubit_state.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class ActionCubitWithArg<Response, Argument, Data, Failure> extends Cubit<ActionCubitState<Data, Failure>> {
  ActionCubitWithArg({
    required this.action,
    required this.stateAdapter,
  }) : super(const ActionCubitState.initial());

  final FutureArgAction<Response, Argument> action;
  final StateAdapter<Response, Data, Failure> stateAdapter;

  Future<void> doAction(Argument argument) async {
    emit(const ActionCubitState.inProgress());

    final result = await stateAdapter.convertResponseToState(() => action(argument));

    emit(
      result.fold(
        ActionCubitState.failure,
        ActionCubitState.success,
      ),
    );
  }
}
