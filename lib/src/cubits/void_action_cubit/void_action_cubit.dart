import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_cubit_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class VoidActionCubit<R, F> extends Cubit<VoidActionCubitState<F>> {
  VoidActionCubit({
    required this.action,
    required this.stateAdapter,
  }) : super(const VoidActionCubitState.initial());

  final FutureAction<R> action;
  final VoidStateAdapter<R, F> stateAdapter;

  Future<void> doAction() async {
    emit(const VoidActionCubitState.inProgress());

    final result = await stateAdapter.convertResponseToState(action);

    emit(
      result.match(
        VoidActionCubitState.failure,
        VoidActionCubitState.success,
      ),
    );
  }
}
