import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_cubit_state.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class ActionCubit<R, A, T, F> extends Cubit<ActionCubitState<T, F>> {
  ActionCubit({
    required this.action,
    required this.stateAdapter,
  }) : super(const ActionCubitState.initial());

  final FutureArgAction<R, A> action;
  final StateAdapter<R, T, F> stateAdapter;

  Future<void> doAction(A argument) async {
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
