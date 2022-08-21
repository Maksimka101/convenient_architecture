part of 'void_action_cubit_state.dart';

mixin _VoidActionStateMappersMixin<Failure> on IVoidActionCubitState<Failure> {
  @override
  T when<T>({
    required Action<T> initial,
    required Action<T> inProgress,
    required Action<T> success,
    required Mapper<T, Failure> failure,
  }) {
    switch (runtimeType) {
      case _InitialVoidActionCubitState:
        return initial();
      case _InProgressVoidActionCubitState:
        return inProgress();
      case _SuccessVoidActionCubitState:
        return success();
      case _FailureVoidActionCubitState:
        return failure((this as _FailureVoidActionCubitState).failure);
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
