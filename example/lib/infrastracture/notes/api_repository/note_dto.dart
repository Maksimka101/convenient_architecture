import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:example/domain/notes/models/note.dart';

class NoteDto {
  NoteDto();
  NoteDto.fromJson(Json json);

  Note toEntity() => Note();
}
