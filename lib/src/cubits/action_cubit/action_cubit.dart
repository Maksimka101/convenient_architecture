import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/states/action_cubit_state.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';

abstract class IActionCubit<Response, Data, Failure>
    extends Cubit<ActionCubitState<Data, Failure>> {
  IActionCubit({
    required this.action,
    required this.stateAdapter,
  }) : super(const ActionCubitState.initial());

  final FutureAction<Response> action;
  final StateAdapter<Response, Data, Failure> stateAdapter;

  Future<void> doAction() async {
    emit(const ActionCubitState.inProgress());

    final result = await stateAdapter.convertResponseToState(action);

    emit(
      result.fold(
        ActionCubitState.failure,
        ActionCubitState.success,
      ),
    );
  }
}
