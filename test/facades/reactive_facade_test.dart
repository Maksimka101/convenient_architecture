import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:test/test.dart';

void main() {
  late _TestFacade facade;

  setUp(() {
    facade = _TestFacade();
  });

  tearDown(() {
    facade.dispose();
  });

  test('Initially data is null', () {
    expect(facade.data, isNull);
  });

  test('Update data and emits to the dataStream on emit', () async {
    int? dataFromStream;
    facade.dataStream.listen((event) {
      dataFromStream = event;
    });
    facade.increment();
    await null;

    expect(facade.data, 1);
    expect(dataFromStream, 1);
  });

  test('Can subscribe multiple times', () {
    facade.dataStream.listen((event) {});
    facade.dataStream.listen((event) {});
    expect(true, isTrue);
  });

  test("Can't update data when facade is disposed", () {
    facade.dispose();
    expect(facade.increment, throwsA(anything));
    expect(facade.data, isNull);
  });
}

class _TestFacade extends ReactiveFacade<int> {
  void increment() {
    emit((data ?? 0) + 1);
  }
}
