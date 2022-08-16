import 'package:equatable/equatable.dart';

abstract class ActionCubitState<Data, Failure> extends Equatable {
  const ActionCubitState._();

  const factory ActionCubitState.initial() = _InitialActionCubitState;
  const factory ActionCubitState.inProgress() = _InProgressActionCubitState;
  const factory ActionCubitState.success(Data data) = _SuccessActionCubitState;
  const factory ActionCubitState.failure(
    Failure failure,
  ) = _FailureActionCubitState;

  @override
  List<Object?> get props => [];
}

class _InitialActionCubitState<_, __> extends ActionCubitState<_, __> {
  const _InitialActionCubitState() : super._();
}

class _InProgressActionCubitState<_, __> extends ActionCubitState<_, __> {
  const _InProgressActionCubitState() : super._();
}

class _SuccessActionCubitState<Data, _> extends ActionCubitState<Data, _> {
  const _SuccessActionCubitState(this.data) : super._();

  final Data data;

  @override
  List<Object?> get props => [data];
}

class _FailureActionCubitState<_, Failure>
    extends ActionCubitState<_, Failure> {
  const _FailureActionCubitState(this.failure) : super._();

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
