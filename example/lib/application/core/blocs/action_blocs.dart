import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:example/domain/core/failure.dart';

class ActionBloc<Event, Data>
    extends IActionBloc<Event, Either<Failure, Data>, Data, Failure> {
  ActionBloc({
    required super.action,
    super.transformer,
  }) : super(stateAdapter: FpStateAdapter());
}

typedef ActionBlocState<Data> = IActionBlocState<Data, Failure>;

class VoidActionBloc<Event>
    extends IVoidActionBloc<Event, Option<Failure>, Failure> {
  VoidActionBloc({
    required super.action,
    super.transformer,
  }) : super(stateAdapter: FpVoidStateAdapter());
}

typedef VoidActionState = IVoidActionBlocState<Failure>;
