import 'dart:async';

typedef VoidAction = void Function();

typedef Action<T> = T Function();

typedef ValueChanged<T> = void Function(T value);

typedef Mapper<T, Q> = T Function(Q data);

typedef FutureAction<T> = Future<T> Function();
typedef FutureOrAction<T> = FutureOr<T> Function();

typedef FutureArgAction<T, Q> = Future<T> Function(Q data);
