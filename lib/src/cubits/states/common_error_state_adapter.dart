import 'package:convenient_architecture/src/cubits/states/state_adapter.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:fpdart/fpdart.dart';

class CommonErrorStateAdapter<Data> extends StateAdapter<Data, Data, GeneralFailure> {
  @override
  Future<Either<GeneralFailure, Data>> convertResponseToState(FutureAction<Data> responseAction) async {
    try {
      return right(await responseAction());
    } catch (e, st) {
      return left(GeneralFailure(error: e, stackTrace: st));
    }
  }
}

class CommonErrorVoidStateAdapter extends VoidStateAdapter<void, GeneralFailure> {
  @override
  Future<Option<GeneralFailure>> convertResponseToState(FutureVoidAction responseAction) async {
    try {
      await responseAction();
      return None();
    } catch (e, st) {
      return some(GeneralFailure(error: e, stackTrace: st));
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
