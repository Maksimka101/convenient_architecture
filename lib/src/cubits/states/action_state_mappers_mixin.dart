// ignore_for_file: avoid_as

part of 'action_bloc_state.dart';

mixin _ActionStateMappersMixin<Data, Failure>
    on IActionBlocState<Data, Failure> {
  @override
  T when<T>({
    required Action<T> initial,
    required Action<T> inProgress,
    required Mapper<T, Data> success,
    required Mapper<T, Failure> failure,
  }) {
    if (this is _InitialActionBlocState) {
      return initial();
    } else if (this is _InProgressActionBlocState) {
      return inProgress();
    } else if (this is _SuccessActionBlocState) {
      return success((this as _SuccessActionBlocState).data);
    } else if (this is _FailureActionBlocState) {
      return failure((this as _FailureActionBlocState).failure);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  T maybeWhen<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Mapper<T, Data>? success,
    Mapper<T, Failure>? failure,
    required Action<T> orElse,
  }) {
    return when(
      initial: initial ?? orElse,
      inProgress: inProgress ?? orElse,
      success: success ?? (_) => orElse(),
      failure: failure ?? (_) => orElse(),
    );
  }

  @override
  T? whenOrNull<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Mapper<T, Data>? success,
    Mapper<T, Failure>? failure,
  }) {
    return maybeWhen(
      failure: failure,
      inProgress: inProgress,
      initial: initial,
      success: success,
      orElse: () => null,
    );
  }

  @override
  bool get isInitial => maybeWhen(initial: () => true, orElse: () => false);
  @override
  bool get isInProgress => maybeWhen(
        inProgress: () => true,
        orElse: () => false,
      );
  @override
  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);
  @override
  bool get isFailure => maybeWhen(failure: (_) => true, orElse: () => false);
}
