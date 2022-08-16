import 'package:convenient_architecture/src/facades/reactive_facade_with_default.dart';

abstract class ReactiveListFacade<T>
    extends ReactiveFacadeWithDefault<List<T>> {
  ReactiveListFacade() : super([]);
}
