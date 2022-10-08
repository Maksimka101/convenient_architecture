import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:example/domain/core/failure.dart';
import 'package:example/domain/notes/models/note.dart';

abstract class INotesApiRepository {
  Future<Either<Failure, List<Note>>> fetchNotes({
    required int page,
    required int perPage,
  });
}
