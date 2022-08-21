import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:equatable/equatable.dart';

part 'void_action_state_mappers_mixin.dart';

abstract class IVoidActionCubitState<Failure> extends Equatable {
  const IVoidActionCubitState._();

  const factory IVoidActionCubitState.initial() = _InitialVoidActionCubitState;
  const factory IVoidActionCubitState.inProgress() =
      _InProgressVoidActionCubitState;
  const factory IVoidActionCubitState.success() = _SuccessVoidActionCubitState;
  const factory IVoidActionCubitState.failure(
    Failure failure,
  ) = _FailureVoidActionCubitState;

  T when<T>({
    required Action<T> initial,
    required Action<T> inProgress,
    required Action<T> success,
    required Mapper<T, Failure> failure,
  });

  T maybeWhen<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Action<T>? success,
    Mapper<T, Failure>? failure,
    required Action<T> orElse,
  });

  T? whenOrNull<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Action<T>? success,
    Mapper<T, Failure>? failure,
  });

  @override
  List<Object?> get props => [];
}

class _InitialVoidActionCubitState<_> extends IVoidActionCubitState<_>
    with _VoidActionStateMappersMixin<_> {
  const _InitialVoidActionCubitState() : super._();
}

class _InProgressVoidActionCubitState<_> extends IVoidActionCubitState<_>
    with _VoidActionStateMappersMixin<_> {
  const _InProgressVoidActionCubitState() : super._();
}

class _SuccessVoidActionCubitState<_> extends IVoidActionCubitState<_>
    with _VoidActionStateMappersMixin<_> {
  const _SuccessVoidActionCubitState() : super._();
}

class _FailureVoidActionCubitState<Failure>
    extends IVoidActionCubitState<Failure>
    with _VoidActionStateMappersMixin<Failure> {
  const _FailureVoidActionCubitState(this.failure) : super._();

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
