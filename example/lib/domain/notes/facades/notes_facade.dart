import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:example/domain/core/failure.dart';
import 'package:example/domain/notes/api_repository/i_notes_api_repository.dart';
import 'package:example/domain/notes/models/note.dart';

class NotesFacade extends ReactivePaginationFacade<Note> {
  NotesFacade({
    required this.notesApiRepository,
  });

  final INotesApiRepository notesApiRepository;
  static const _perPage = 10;
  var _page = 1;

  Future<Option<Failure>> loadNotes() async {
    final notesResponse = await notesApiRepository.fetchNotes(
      page: _page,
      perPage: _perPage,
    );

    return notesResponse.fold(
      some,
      (notes) {
        emit(
          data.copyWith(
            items: [...data.items, ...notes],
            canLoadMore: notes.length == _perPage,
          ),
        );
        _page++;
        return const None();
      },
    );
  }
}
