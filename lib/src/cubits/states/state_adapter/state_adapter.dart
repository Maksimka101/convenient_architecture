import 'package:convenient_architecture/src/cubits/states/state_adapter/common_error_state_adapter.dart';
import 'package:convenient_architecture/src/cubits/states/state_adapter/fp_state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:fpdart/fpdart.dart';

/// State adapter is used to call the `requestAction` and map its result to the
/// [Response].
///
/// For the examples take a look at the [CommonErrorStateAdapter] and [FpStateAdapter].
abstract class IStateAdapter<Event, Response, Data, Failure> {
  Future<Either<Failure, Data>> convertResponseToState(
    Event event,
    FutureArgAction<Response, Event> requestAction,
  );
}

abstract class IVoidStateAdapter<Event, Response, Failure> {
  Future<Option<Failure>> convertResponseToState(
    Event event,
    FutureArgAction<Response, Event> requestAction,
  );
}
