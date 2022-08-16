import 'dart:async';

import 'package:meta/meta.dart';

/// Interface for classes which wants to release any resources retained
/// by this object.
abstract class Disposable {
  @mustCallSuper
  FutureOr<void> dispose();
}
