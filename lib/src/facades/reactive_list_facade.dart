import 'package:convenient_architecture/src/facades/reactive_facade_with_default.dart';

/// Shortcut for the [ReactiveFacadeWithDefault] with the [List] of [T].
abstract class ReactiveListFacade<T>
    extends ReactiveFacadeWithDefault<List<T>> {
  ReactiveListFacade() : super([]);
}
