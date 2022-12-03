part of 'void_action_bloc_state.dart';

mixin _VoidActionStateMappersMixin<Failure> on IVoidActionBlocState<Failure> {
  @override
  T when<T>({
    required Action<T> initial,
    required Action<T> inProgress,
    required Action<T> success,
    required Mapper<T, Failure> failure,
  }) {
    if (this is _InitialVoidActionBlocState) {
      return initial();
    } else if (this is _InProgressVoidActionBlocState) {
      return inProgress();
    } else if (this is _SuccessVoidActionBlocState) {
      return success();
    } else if (this is _FailureVoidActionBlocState) {
      return failure((this as _FailureVoidActionBlocState).failure);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  T maybeWhen<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Action<T>? success,
    Mapper<T, Failure>? failure,
    required Action<T> orElse,
  }) {
    return when(
      initial: initial ?? orElse,
      inProgress: inProgress ?? orElse,
      success: success ?? orElse,
      failure: failure ?? (_) => orElse(),
    );
  }

  @override
  T? whenOrNull<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Action<T>? success,
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
  bool get isSuccess => maybeWhen(success: () => true, orElse: () => false);
  @override
  bool get isFailure => maybeWhen(failure: (_) => true, orElse: () => false);
}
