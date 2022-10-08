import 'package:dio/dio.dart';
import 'package:example/application/core/blocs/locator/toor.dart';
import 'package:example/application/notes/notes_loading_blocs.dart';
import 'package:example/domain/notes/api_repository/i_notes_api_repository.dart';
import 'package:example/domain/notes/facades/notes_facade.dart';
import 'package:example/infrastracture/notes/api_repository/notes_api_repository.dart';

final notesCubitFactory = toor.registerFactoryWithParam(NotesCubit.new);
final notesLoaderBlocFactory =
    toor.registerFactoryWithParam(NotesLoaderBloc.new);

final notesFacadeFactory = toor.registerFactory(
  () => NotesFacade(notesApiRepository: notesApiRepositoryFactory()),
);

final notesApiRepositoryFactory = toor.registerFactory<INotesApiRepository>(
  () => NotesApiRepository(dio: Dio()),
);
