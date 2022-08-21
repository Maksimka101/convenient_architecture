import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_cubit_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IVoidActionCubit<Response, Failure>
    extends Cubit<IVoidActionCubitState<Failure>> {
  IVoidActionCubit({
    required this.action,
    required this.stateAdapter,
  }) : super(const IVoidActionCubitState.initial());

  final FutureAction<Response> action;
  final VoidStateAdapter<Response, Failure> stateAdapter;

  Future<void> doAction() async {
    emit(const IVoidActionCubitState.inProgress());

    final result = await stateAdapter.convertResponseToState(action);

    emit(
      result.match(
        IVoidActionCubitState.failure,
        IVoidActionCubitState.success,
      ),
    );
  }
}
