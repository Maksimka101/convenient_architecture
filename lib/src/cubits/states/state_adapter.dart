import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:fpdart/fpdart.dart';

abstract class StateAdapter<Response, Data, Failure> {
  Future<Either<Failure, Data>> convertResponseToState(FutureAction<Response> responseAction);
}

abstract class VoidStateAdapter<Failure> {
  Future<Option<Failure>> convertResponseToState(FutureVoidAction responseAction);
}
