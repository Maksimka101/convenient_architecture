import 'package:convenient_architecture/src/cubits/states/state_adapter/state_adapter.dart';
import 'package:convenient_architecture/src/facades/reactive_facade.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:fpdart/fpdart.dart';

/// Implementation of the [IStateAdapter] for actions which are returns [Either].
///
/// Facade methods should return [Either] so this action adapter is supposed to be
/// used with the [ReactiveFacade] methods.
class FpStateAdapter<Event, Data, Failure>
    extends IStateAdapter<Event, Either<Failure, Data>, Data, Failure> {
  @override
  Future<Either<Failure, Data>> convertResponseToState(
    Event event,
    FutureArgAction<Either<Failure, Data>, Event> requestAction,
  ) {
    return requestAction(event);
  }
}

/// Implementation of the [IStateAdapter] for actions which are returns [Option].
///
/// Facade methods should return [Option] so this action adapter is supposed to be
/// used with the [ReactiveFacade] methods.
class FpVoidStateAdapter<Event, Failure>
    extends IVoidStateAdapter<Event, Option<Failure>, Failure> {
  @override
  Future<Option<Failure>> convertResponseToState(
    Event event,
    FutureArgAction<Option<Failure>, Event> requestAction,
  ) {
    return requestAction(event);
  }
}
