import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:example/domain/notes/models/note.dart';

class NoteDto {
  NoteDto(this.id);

  NoteDto.fromJson(Json json) : id = json['id'];

  final String id;

  Note toEntity() => Note(id);
}
