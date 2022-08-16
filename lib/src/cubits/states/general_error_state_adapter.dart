import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:fpdart/fpdart.dart';

class GeneralErrorStateAdapter<Data> extends StateAdapter<Data, Data, GeneralFailure> {
  @override
  Future<Either<GeneralFailure, Data>> convertResponseToState(FutureOrAction<Data> responseAction) async {
    try {
      return right(await responseAction());
    } catch (e, st) {
      return left(GeneralFailure(error: e, stackTrace: st));
    }
  }
}

class GeneralFailure {
  GeneralFailure({
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;
}
