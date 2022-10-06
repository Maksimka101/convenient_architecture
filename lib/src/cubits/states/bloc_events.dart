class ActionBlocEvent {
  const ActionBlocEvent();
}

class ActionArgBlocEvent<T> {
  ActionArgBlocEvent(this.argument);

  final T argument;
}
