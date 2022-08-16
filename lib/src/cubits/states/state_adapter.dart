import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:fpdart/fpdart.dart';

abstract class StateAdapter<Response, Data, Failure> {
  Future<Either<Failure, Data>> convertResponseToState(FutureOrAction<Response> responseAction);
}
