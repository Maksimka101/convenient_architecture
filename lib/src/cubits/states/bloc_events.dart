import 'package:equatable/equatable.dart';

class IActionEvent {
  const IActionEvent();
}

class IActionArgEvent<T> extends Equatable {
  const IActionArgEvent(this.argument);

  final T argument;

  @override
  List<Object?> get props => [argument];
}
