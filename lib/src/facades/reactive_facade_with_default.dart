import 'package:convenient_architecture/src/facades/reactive_facade.dart';

/// The same as [ReactiveFacade] but its [data] can't be null.
///
/// In case of null it's replaced with [_defaultData].
abstract class ReactiveFacadeWithDefault<T> extends ReactiveFacade<T> {
  ReactiveFacadeWithDefault(this._defaultData);

  final T _defaultData;

  @override
  T get data => super.data ?? _defaultData;
}
