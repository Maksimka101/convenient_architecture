import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:equatable/equatable.dart';
part 'action_state_mappers_mixin.dart';

abstract class IActionBlocState<Data, Failure> extends Equatable {
  const IActionBlocState._();

  const factory IActionBlocState.initial() = _InitialActionBlocState;
  const factory IActionBlocState.inProgress() = _InProgressActionBlocState;
  const factory IActionBlocState.success(Data data) = _SuccessActionBlocState;
  const factory IActionBlocState.failure(
    Failure failure,
  ) = _FailureActionBlocState;

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

class _InitialActionBlocState<_, __> extends IActionBlocState<_, __>
    with _ActionStateMappersMixin<_, __> {
  const _InitialActionBlocState() : super._();
}

class _InProgressActionBlocState<_, __> extends IActionBlocState<_, __>
    with _ActionStateMappersMixin<_, __> {
  const _InProgressActionBlocState() : super._();
}

class _SuccessActionBlocState<Data, _> extends IActionBlocState<Data, _>
    with _ActionStateMappersMixin<Data, _> {
  const _SuccessActionBlocState(this.data) : super._();

  final Data data;

  @override
  List<Object?> get props => [data];
}

class _FailureActionBlocState<_, Failure> extends IActionBlocState<_, Failure>
    with _ActionStateMappersMixin<_, Failure> {
  const _FailureActionBlocState(this.failure) : super._();

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
