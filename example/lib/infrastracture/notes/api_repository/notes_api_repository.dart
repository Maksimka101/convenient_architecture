import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:dio/dio.dart';
import 'package:example/domain/core/failure.dart';
import 'package:example/domain/notes/api_repository/i_notes_api_repository.dart';
import 'package:example/infrastracture/core/dio_api_response_parser.dart';
import 'package:example/domain/notes/models/note.dart';
import 'package:example/infrastracture/notes/api_repository/note_dto.dart';

class NotesApiRepository extends INotesApiRepository {
  NotesApiRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Either<Failure, List<Note>>> fetchNotes({
    required int page,
    required int perPage,
  }) {
    return parseListApiResponse(
      requestAction: () => dio.get('/notes?page=$page&per_page=$perPage'),
      mapper: (json) => NoteDto.fromJson(json).toEntity(),
    );
  }
}
