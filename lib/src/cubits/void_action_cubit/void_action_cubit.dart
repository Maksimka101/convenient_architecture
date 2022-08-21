import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_cubit_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IVoidActionCubit<Response, Failure>
    extends Cubit<VoidActionCubitState<Failure>> {
  IVoidActionCubit({
    required this.action,
    required this.stateAdapter,
  }) : super(const VoidActionCubitState.initial());

  final FutureAction<Response> action;
  final VoidStateAdapter<Response, Failure> stateAdapter;

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
