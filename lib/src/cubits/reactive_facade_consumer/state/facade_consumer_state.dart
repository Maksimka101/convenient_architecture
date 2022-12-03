import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

part 'facade_consumer_state_mixin.dart';

abstract class FacadeConsumerState<Data> extends Equatable {
  const FacadeConsumerState._();

  const factory FacadeConsumerState.initial() = _InitialFacadeConsumerState;
  const factory FacadeConsumerState.loaded(Data data) =
      _LoadedFacadeConsumerState;

  T when<T>({
    required Action<T> initial,
    required Mapper<T, Data> loaded,
  });

  T? whenOrNull<T>({
    Action<T>? initial,
    Mapper<T, Data>? loaded,
  });

  bool get isInitial;
  bool get isLoaded;
  Data? get data;

  @override
  List<Object?> get props => [];
}

class _InitialFacadeConsumerState<_> extends FacadeConsumerState<_>
    with _FacadeStateMappersMixin<_> {
  const _InitialFacadeConsumerState() : super._();
}

class _LoadedFacadeConsumerState<Data> extends FacadeConsumerState<Data>
    with _FacadeStateMappersMixin<Data> {
  const _LoadedFacadeConsumerState(this.data) : super._();

  @override
  final Data data;

  @override
  List<Object?> get props => [data];
}
