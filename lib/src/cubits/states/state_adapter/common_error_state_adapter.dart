import 'package:convenient_architecture/src/cubits/states/state_adapter/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

/// State adapter which catches errors from the `requestAction` and returns
/// the [Either] of the [Data] or [GeneralFailure].
class CommonErrorStateAdapter<Event, Data>
    extends IStateAdapter<Event, Data, Data, GeneralFailure> {
  @override
  Future<Either<GeneralFailure, Data>> convertResponseToState(
    Event event,
    FutureArgAction<Data, Event> requestAction,
  ) async {
    try {
      return right(await requestAction(event));
    } catch (e, st) {
      return left(GeneralFailure(error: e, stackTrace: st));
    }
  }
}

/// State adapter which catches errors from the `requestAction` and returns
/// the [Option] of the [GeneralFailure].
class CommonVoidErrorStateAdapter<Event, Data>
    extends IStateAdapter<Event, Data, Data, GeneralFailure> {
  @override
  Future<Either<GeneralFailure, Data>> convertResponseToState(
    Event event,
    FutureArgAction<Data, Event> requestAction,
  ) async {
    try {
      return right(await requestAction(event));
    } catch (e, st) {
      return left(GeneralFailure(error: e, stackTrace: st));
    }
  }
}

class CommonErrorVoidStateAdapter<Event>
    extends IVoidStateAdapter<Event, void, GeneralFailure> {
  @override
  Future<Option<GeneralFailure>> convertResponseToState(
    Event event,
    FutureArgAction<void, Event> requestAction,
  ) async {
    try {
      await requestAction(event);
      return const None();
    } catch (e, st) {
      return some(GeneralFailure(error: e, stackTrace: st));
    }
  }
}

class GeneralFailure extends Equatable {
  const GeneralFailure({
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  List<Object?> get props => [error, stackTrace];
}
