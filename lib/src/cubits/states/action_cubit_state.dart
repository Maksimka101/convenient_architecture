import 'package:equatable/equatable.dart';

abstract class ActionCubitState<T, F> extends Equatable {
  const ActionCubitState._();

  const factory ActionCubitState.initial() = _InitialActionCubitState;
  const factory ActionCubitState.inProgress() = _InProgressActionCubitState;
  const factory ActionCubitState.success(T data) = _SuccessActionCubitState;
  const factory ActionCubitState.failure(F failure) = _FailureActionCubitState;

  @override
  List<Object?> get props => [];
}

class _InitialActionCubitState<T, F> extends ActionCubitState<T, F> {
  const _InitialActionCubitState() : super._();
}

class _InProgressActionCubitState<T, F> extends ActionCubitState<T, F> {
  const _InProgressActionCubitState() : super._();
}

class _SuccessActionCubitState<T, F> extends ActionCubitState<T, F> {
  const _SuccessActionCubitState(this.data) : super._();

  final T data;

  @override
  List<Object?> get props => [data];
}

class _FailureActionCubitState<T, F> extends ActionCubitState<T, F> {
  const _FailureActionCubitState(this.failure) : super._();

  final F failure;

  @override
  List<Object?> get props => [failure];
}
