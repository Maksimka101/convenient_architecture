import 'dart:async';

import 'package:convenient_architecture/src/helpers/disposable.dart';
import 'package:meta/meta.dart';

/// Base for the most facades.
///
/// Almost all facades should be reactive. That is they should have loading function
/// which loads data and [emit]s it to the [dataStream] but don't returns this data.
///
/// Usage example:
/// ```
/// class User {}
///
/// class UserRepository with ReactiveFacade<User> {
///   final IUserApiRepository userApiRepository;
///
///   /// Facade method should returns result status: either error or success.
///   /// Data must be emitted.
///   Future<Option<Failure>> loadUser() async {
///     try {
///       final user = await userApiRepository.fetch();
///       emit(user);
///       return const None();
///     } catch (e, st) {
///       return some(Failure(e, st));
///     }
///   }
///
///   @override
///   Future<void> dispose() async {
///     await userApiRepository.close();
///     return super.dispose();
///   }
/// }
/// ```
abstract class ReactiveFacade<T> implements Disposable {
  final _dataStreamController = StreamController<T>.broadcast();
  T? _data;

  /// Stream of data from the facade.
  Stream<T> get dataStream => _dataStreamController.stream;

  /// Latest value that was [emit]ted to the [dataStream].
  T? get data => _data;

  bool get isClosed => _dataStreamController.isClosed;

  /// Emits a [newData] to the [dataStream] and updates [data].
  @protected
  @visibleForTesting
  void emit(T newData) {
    assert(!isClosed, "Can't emit data to the closed $runtimeType.");
    _data = newData;
    _dataStreamController.add(newData);
  }

  /// Disposes all resources.
  ///
  /// Here you can close all DB or WebSocket connections.
  @override
  Future<void> dispose() async {
    await _dataStreamController.close();
  }
}
