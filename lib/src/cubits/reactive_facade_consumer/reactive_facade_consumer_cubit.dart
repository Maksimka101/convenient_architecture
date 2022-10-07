import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/src/facades/reactive_facade.dart';
import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:equatable/equatable.dart';

/// Base for the cubit which listens to the [ReactiveFacade.dataStream].
class ReactiveFacadeConsumerCubit<T>
    extends Cubit<ReactiveFacadeConsumerCubitState<T>> {
  ReactiveFacadeConsumerCubit(
    this.facade,
  ) : super(const ReactiveFacadeConsumerCubitState.initial());

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
    emit(
      ReactiveFacadeConsumerCubitState(data: data),
    );
  }

  @override
  Future<void> close() {
    _facadeSubscription?.cancel();
    return super.close();
  }
}

class ReactiveFacadeConsumerCubitState<T> extends Equatable {
  const ReactiveFacadeConsumerCubitState({
    required this.data,
  });

  /// The initial/empty state.
  const ReactiveFacadeConsumerCubitState.initial() : data = null;

  final T? data;

  Q when<Q>({
    required Action initial,
    required Mapper<Q, T> loaded,
  }) {
    final data = this.data;
    if (data == null) {
      return initial();
    } else {
      return loaded(data);
    }
  }

  @override
  List<Object?> get props => [data];
}
