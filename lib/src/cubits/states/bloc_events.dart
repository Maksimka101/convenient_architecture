class IActionEvent {
  const IActionEvent();
}

class IActionArgEvent<T> {
  IActionArgEvent(this.argument);

  final T argument;
}
