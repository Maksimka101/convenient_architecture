import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/cubits/reactive_facade_consumer/state/facade_consumer_state.dart';
import 'package:convenient_architecture/src/facades/reactive_facade.dart';

@Deprecated("Use `FacadeConsumerCubit` instead")
typedef ReactiveFacadeConsumerCubit<T> = FacadeConsumerCubit<T>;

/// Base for the cubit which listens to the [ReactiveFacade.dataStream].
class FacadeConsumerCubit<T> extends Cubit<FacadeConsumerState<T>> {
  FacadeConsumerCubit(
    this.facade,
  ) : super(const FacadeConsumerState.initial());

  final ReactiveFacade<T> facade;

  StreamSubscription<T>? _facadeSubscription;

  void startListening({bool handleInitialData = true}) {
    _facadeSubscription?.cancel();

    _facadeSubscription = facade.dataStream.listen(_handleData);
    final data = facade.data;
    if (handleInitialData && data != null) {
      _handleData(data);
    }
  }

  void _handleData(T data) {
    emit(FacadeConsumerState.loaded(data));
  }

  @override
  Future<void> close() {
    _facadeSubscription?.cancel();
    return super.close();
  }
}
