import 'package:equatable/equatable.dart';

abstract class VoidActionCubitState<F> extends Equatable {
  const VoidActionCubitState._();

  const factory VoidActionCubitState.initial() = _InitialVoidActionCubitState;
  const factory VoidActionCubitState.inProgress() = _InProgressVoidActionCubitState;
  const factory VoidActionCubitState.success() = _SuccessVoidActionCubitState;
  const factory VoidActionCubitState.failure(F failure) = _FailureVoidActionCubitState;

  @override
  List<Object?> get props => [];
}

class _InitialVoidActionCubitState<F> extends VoidActionCubitState<F> {
  const _InitialVoidActionCubitState() : super._();
}

class _InProgressVoidActionCubitState<F> extends VoidActionCubitState<F> {
  const _InProgressVoidActionCubitState() : super._();
}

class _SuccessVoidActionCubitState<F> extends VoidActionCubitState<F> {
  const _SuccessVoidActionCubitState() : super._();
}

class _FailureVoidActionCubitState<F> extends VoidActionCubitState<F> {
  const _FailureVoidActionCubitState(this.failure) : super._();

  final F failure;

  @override
  List<Object?> get props => [failure];
}
