import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:equatable/equatable.dart';
part 'action_state_mappers_mixin.dart';

abstract class IActionCubitState<Data, Failure> extends Equatable {
  const IActionCubitState._();

  const factory IActionCubitState.initial() = _InitialActionCubitState;
  const factory IActionCubitState.inProgress() = _InProgressActionCubitState;
  const factory IActionCubitState.success(Data data) = _SuccessActionCubitState;
  const factory IActionCubitState.failure(
    Failure failure,
  ) = _FailureActionCubitState;

  T when<T>({
    required Action<T> initial,
    required Action<T> inProgress,
    required Mapper<T, Data> success,
    required Mapper<T, Failure> failure,
  });

  T maybeWhen<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Mapper<T, Data>? success,
    Mapper<T, Failure>? failure,
    required Action<T> orElse,
  });

  T? whenOrNull<T>({
    Action<T>? initial,
    Action<T>? inProgress,
    Mapper<T, Data>? success,
    Mapper<T, Failure>? failure,
  });

  @override
  List<Object?> get props => [];
}

class _InitialActionCubitState<_, __> extends IActionCubitState<_, __>
    with _ActionStateMappersMixin<_, __> {
  const _InitialActionCubitState() : super._();
}

class _InProgressActionCubitState<_, __> extends IActionCubitState<_, __>
    with _ActionStateMappersMixin<_, __> {
  const _InProgressActionCubitState() : super._();
}

class _SuccessActionCubitState<Data, _> extends IActionCubitState<Data, _>
    with _ActionStateMappersMixin<Data, _> {
  const _SuccessActionCubitState(this.data) : super._();

  final Data data;

  @override
  List<Object?> get props => [data];
}

class _FailureActionCubitState<_, Failure> extends IActionCubitState<_, Failure>
    with _ActionStateMappersMixin<_, Failure> {
  const _FailureActionCubitState(this.failure) : super._();

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
