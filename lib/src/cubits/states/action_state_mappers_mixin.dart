part of 'action_cubit_state.dart';

mixin _ActionStateMappersMixin<Data, Failure>
    on ActionCubitState<Data, Failure> {
  @override
  T when<T>({
    required Action<T> initial,
    required Action<T> inProgress,
    required Mapper<T, Data> success,
    required Mapper<T, Failure> failure,
  }) {
    switch (runtimeType) {
      case _InitialActionCubitState:
        return initial();
      case _InProgressActionCubitState:
        return inProgress();
      case _SuccessActionCubitState:
        return success((this as _SuccessActionCubitState).data);
      case _FailureActionCubitState:
        return failure((this as _FailureActionCubitState).failure);
      default:
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
}
