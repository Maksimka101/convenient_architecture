import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/void_action_cubit_state.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IVoidActionCubitWithArg<Request, Argument, Failure>
    extends Cubit<IVoidActionCubitState<Failure>> {
  IVoidActionCubitWithArg({
    required this.action,
    required this.stateAdapter,
  }) : super(const IVoidActionCubitState.initial());

  final FutureArgAction<Request, Argument> action;
  final VoidStateAdapter<Request, Failure> stateAdapter;

  Future<void> doAction(Argument argument) async {
    emit(const IVoidActionCubitState.inProgress());

    final result = await stateAdapter.convertResponseToState(
      () => action(argument),
    );

    emit(
      result.match(
        IVoidActionCubitState.failure,
        IVoidActionCubitState.success,
      ),
    );
  }
}
