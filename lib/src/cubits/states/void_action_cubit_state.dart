import 'package:equatable/equatable.dart';

abstract class VoidActionCubitState<T, F> extends Equatable {
  const VoidActionCubitState._();

  const factory VoidActionCubitState.initial() = _InitialVoidActionCubitState;
  const factory VoidActionCubitState.inProgress() = _InProgressVoidActionCubitState;
  const factory VoidActionCubitState.success(T data) = _SuccessVoidActionCubitState;
  const factory VoidActionCubitState.failure(F failure) = _FailureVoidActionCubitState;

  @override
  List<Object?> get props => [];
}

class _InitialVoidActionCubitState<T, F> extends VoidActionCubitState<T, F> {
  const _InitialVoidActionCubitState() : super._();
}

class _InProgressVoidActionCubitState<T, F> extends VoidActionCubitState<T, F> {
  const _InProgressVoidActionCubitState() : super._();
}

class _SuccessVoidActionCubitState<T, F> extends VoidActionCubitState<T, F> {
  const _SuccessVoidActionCubitState(this.data) : super._();

  final T data;

  @override
  List<Object?> get props => [data];
}

class _FailureVoidActionCubitState<T, F> extends VoidActionCubitState<T, F> {
  const _FailureVoidActionCubitState(this.failure) : super._();

  final F failure;

  @override
  List<Object?> get props => [failure];
}
