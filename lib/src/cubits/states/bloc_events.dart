import 'package:equatable/equatable.dart';

class BlocEvent {
  const BlocEvent();
}

class BlocArgEvent<T> extends Equatable {
  const BlocArgEvent(this.argument);

  final T argument;

  @override
  List<Object?> get props => [argument];
}
