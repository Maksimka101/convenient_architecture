import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class CommonErrorStateAdapter<Event, Data>
    extends StateAdapter<Event, Data, Data, GeneralFailure> {
  @override
  Future<Either<GeneralFailure, Data>> convertResponseToState(
    Event event,
    FutureArgAction<Data, Event> responseAction,
  ) async {
    try {
      return right(await responseAction(event));
    } catch (e, st) {
      return left(GeneralFailure(error: e, stackTrace: st));
    }
  }
}

class CommonErrorVoidStateAdapter<Event>
    extends VoidStateAdapter<Event, void, GeneralFailure> {
  @override
  Future<Option<GeneralFailure>> convertResponseToState(
    Event event,
    FutureArgAction<void, Event> responseAction,
  ) async {
    try {
      await responseAction(event);
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
