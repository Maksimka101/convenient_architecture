import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

mixin BlocStreamListenableMixin<S> on BlocBase<S> {
  StreamSubscription? _singleSubscription;
  final _subscriptions = <StreamSubscription>[];

  @protected
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

  @protected
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
