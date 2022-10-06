part of 'void_action_bloc_state.dart';

mixin _VoidActionStateMappersMixin<Failure> on IVoidActionBlocState<Failure> {
  @override
  T when<T>({
    required Action<T> initial,
    required Action<T> inProgress,
    required Action<T> success,
    required Mapper<T, Failure> failure,
  }) {
    switch (runtimeType) {
      case _InitialVoidActionBlocState:
        return initial();
      case _InProgressVoidActionBlocState:
        return inProgress();
      case _SuccessVoidActionBlocState:
        return success();
      case _FailureVoidActionBlocState:
        return failure((this as _FailureVoidActionBlocState).failure);
      default:
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
}
