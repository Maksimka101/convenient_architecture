import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_cubit_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class VoidActionCubitWithArg<Request, Argument, Failure> extends Cubit<VoidActionCubitState<Failure>> {
  VoidActionCubitWithArg({
    required this.action,
    required this.stateAdapter,
  }) : super(const VoidActionCubitState.initial());

  final FutureArgAction<Request, Argument> action;
  final VoidStateAdapter<Request, Failure> stateAdapter;

  Future<void> doAction(Argument argument) async {
    emit(const VoidActionCubitState.inProgress());

    final result = await stateAdapter.convertResponseToState(() => action(argument));

    emit(
      result.match(
        VoidActionCubitState.failure,
        VoidActionCubitState.success,
      ),
    );
  }
}
