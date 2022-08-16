import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_cubit_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class ActionCubit<R, A, T, F> extends Cubit<VoidActionCubitState<T, F>> {
  ActionCubit({
    required this.action,
    required this.stateAdapter,
  }) : super(const VoidActionCubitState.initial());

  final FutureArgAction<R, A> action;
  final StateAdapter<R, T, F> stateAdapter;

  Future<void> doAction(A argument) async {
    emit(const VoidActionCubitState.inProgress());

    final result = await stateAdapter.convertResponseToState(() => action(argument));

    emit(
      result.fold(
        VoidActionCubitState.failure,
        VoidActionCubitState.success,
      ),
    );
  }
}
