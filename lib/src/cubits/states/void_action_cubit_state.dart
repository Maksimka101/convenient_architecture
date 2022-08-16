import 'package:equatable/equatable.dart';

abstract class VoidActionCubitState<Failure> extends Equatable {
  const VoidActionCubitState._();

  const factory VoidActionCubitState.initial() = _InitialVoidActionCubitState;
  const factory VoidActionCubitState.inProgress() =
      _InProgressVoidActionCubitState;
  const factory VoidActionCubitState.success() = _SuccessVoidActionCubitState;
  const factory VoidActionCubitState.failure(
    Failure failure,
  ) = _FailureVoidActionCubitState;

  @override
  List<Object?> get props => [];
}

class _InitialVoidActionCubitState<_> extends VoidActionCubitState<_> {
  const _InitialVoidActionCubitState() : super._();
}

class _InProgressVoidActionCubitState<_> extends VoidActionCubitState<_> {
  const _InProgressVoidActionCubitState() : super._();
}

class _SuccessVoidActionCubitState<_> extends VoidActionCubitState<_> {
  const _SuccessVoidActionCubitState() : super._();
}

class _FailureVoidActionCubitState<Failure>
    extends VoidActionCubitState<Failure> {
  const _FailureVoidActionCubitState(this.failure) : super._();

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
