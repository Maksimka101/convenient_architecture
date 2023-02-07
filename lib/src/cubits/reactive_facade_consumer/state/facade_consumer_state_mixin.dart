// ignore_for_file: avoid_as

part of 'facade_consumer_state.dart';

mixin _FacadeStateMappersMixin<Data> on FacadeConsumerState<Data> {
  @override
  T when<T>({
    required Action<T> initial,
    required Mapper<T, Data> loaded,
  }) {
    final state = this;
    if (state is _InitialFacadeConsumerState) {
      return initial();
    } else if (state is _LoadedFacadeConsumerState) {
      return loaded((state as _LoadedFacadeConsumerState).data);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  T? whenOrNull<T>({
    Action<T>? initial,
    Mapper<T, Data>? loaded,
  }) {
    return when(
      initial: () => initial?.call(),
      loaded: (data) => loaded?.call(data),
    );
  }

  @override
  bool get isInitial => when(initial: () => true, loaded: (_) => false);
  @override
  bool get isLoaded => when(loaded: (_) => true, initial: () => false);

  @override
  Data? get data => whenOrNull(loaded: identity);
}
