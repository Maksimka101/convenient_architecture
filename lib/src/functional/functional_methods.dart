import 'dart:async';

/// `constf a` is a unary function which evaluates to `a` for all inputs.
T Function([Object? _, Object? __, Object? ___]) constF<T>(T value) {
  return ([_, __, ___]) => value;
}

FutureOr<void> absent([Object? _, Object? __, Object? ___]) {}
