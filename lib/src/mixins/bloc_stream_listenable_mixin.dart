import 'dart:async';

import 'package:bloc/bloc.dart';

mixin BlocStreamListenableMixin<S> on BlocBase<S> {
  StreamSubscription? _singleSubscription;
  final _subscriptions = <StreamSubscription>[];

  void addSingleSubscription<T>(
    Stream<T> stream,
    void Function(T value) listener, {
    void Function(Object error, StackTrace stackTrace)? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    _singleSubscription?.cancel();
    _singleSubscription = stream.listen(
      listener,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  }

  void addSubscription<T>(
    Stream<T> stream,
    void Function(T value) listener, {
    void Function(Object error, StackTrace stackTrace)? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    _subscriptions.add(
      stream.listen(
        listener,
        onDone: onDone,
        onError: onError,
        cancelOnError: cancelOnError,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _singleSubscription?.cancel();
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }

    return super.close();
  }
}
