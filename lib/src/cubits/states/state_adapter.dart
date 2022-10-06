import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:fpdart/fpdart.dart';

abstract class StateAdapter<Event, Response, Data, Failure> {
  Future<Either<Failure, Data>> convertResponseToState(
    Event event,
    FutureArgAction<Response, Event> responseAction,
  );
}

abstract class VoidStateAdapter<Event, Response, Failure> {
  Future<Option<Failure>> convertResponseToState(
    Event event,
    FutureArgAction<Response, Event> responseAction,
  );
}
