import 'dart:async';

typedef Json = Map<String, dynamic>;

typedef VoidAction = void Function();

typedef Action<T> = T Function();

typedef ValueActionChanged<T> = void Function(T value);

typedef FutureValueChanged<T> = Future<void> Function(T value);

typedef Mapper<T, Q> = T Function(Q data);

typedef FutureAction<T> = Future<T> Function();

typedef FutureVoidAction = Future<void> Function();

typedef FutureArgAction<T, Q> = Future<T> Function(Q data);
