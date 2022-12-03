import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:equatable/equatable.dart';

part 'void_action_state_mappers_mixin.dart';

abstract class IVoidActionBlocState<Failure> extends Equatable {
  const IVoidActionBlocState._();

  const factory IVoidActionBlocState.initial() = _InitialVoidActionBlocState;
  const factory IVoidActionBlocState.inProgress() =
      _InProgressVoidActionBlocState;
  const factory IVoidActionBlocState.success() = _SuccessVoidActionBlocState;
  const factory IVoidActionBlocState.failure(
    Failure failure,
  ) = _FailureVoidActionBlocState;

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

  bool get isInitial;
  bool get isInProgress;
  bool get isSuccess;
  bool get isFailure;

  @override
  List<Object?> get props => [];
}

class _InitialVoidActionBlocState<_> extends IVoidActionBlocState<_>
    with _VoidActionStateMappersMixin<_> {
  const _InitialVoidActionBlocState() : super._();
}

class _InProgressVoidActionBlocState<_> extends IVoidActionBlocState<_>
    with _VoidActionStateMappersMixin<_> {
  const _InProgressVoidActionBlocState() : super._();
}

class _SuccessVoidActionBlocState<_> extends IVoidActionBlocState<_>
    with _VoidActionStateMappersMixin<_> {
  const _SuccessVoidActionBlocState() : super._();
}

class _FailureVoidActionBlocState<Failure> extends IVoidActionBlocState<Failure>
    with _VoidActionStateMappersMixin<Failure> {
  const _FailureVoidActionBlocState(this.failure) : super._();

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
