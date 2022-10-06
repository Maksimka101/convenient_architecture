import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/convenient_architecture.dart';

abstract class IVoidActionBlocWithArg<Request, Argument, Failure>
    extends Bloc<ActionArgBlocEvent<Argument>, IVoidActionBlocState<Failure>> {
  IVoidActionBlocWithArg({
    required FutureArgAction<Request, Argument> action,
    required VoidStateAdapter<Request, Failure> stateAdapter,
    EventTransformer<ActionArgBlocEvent<Argument>>? transformer,
  }) : super(const IVoidActionBlocState.initial()) {
    on<ActionArgBlocEvent<Argument>>(
      transformer: transformer,
      (event, emit) async {
        emit(const IVoidActionBlocState.inProgress());

        final result = await stateAdapter.convertResponseToState(
          () => action(event.argument),
        );

        emit(
          result.match(
            IVoidActionBlocState.failure,
            IVoidActionBlocState.success,
          ),
        );
      },
    );
  }
}
