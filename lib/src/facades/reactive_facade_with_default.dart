import 'package:convenient_architecture/src/facades/reactive_facade.dart';

abstract class ReactiveFacadeWithDefault<T> extends ReactiveFacade<T> {
  ReactiveFacadeWithDefault(this._defaultData);

  final T _defaultData;

  @override
  T get data => super.data ?? _defaultData;
}
