import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:example/application/core/blocs/action_blocs.dart';
import 'package:example/domain/notes/facades/notes_facade.dart';
import 'package:example/domain/notes/models/note.dart';

class NotesCubit extends ReactiveFacadeConsumerCubit<PaginationInfo<Note>> {
  NotesCubit(super.facade);
}

typedef NotesCubitState
    = ReactiveFacadeConsumerCubitState<PaginationInfo<Note>>;

class NotesLoaderBloc extends VoidActionBloc<NotesLoadRequestedEvent> {
  NotesLoaderBloc(NotesFacade notesFacade)
      : super(action: (_) => notesFacade.loadNotes());
}

typedef NotesLoadRequestedEvent = BlocEvent;
typedef NotesLoaderState = VoidActionState;
