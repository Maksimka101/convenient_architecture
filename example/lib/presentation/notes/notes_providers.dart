import 'package:example/application/notes/notes_dependencies.dart';
import 'package:example/application/notes/notes_loading_blocs.dart';
import 'package:example/domain/notes/facades/notes_facade.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class NotesProviders extends StatelessWidget {
  const NotesProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => notesFacadeFactory(),
          dispose: (_, facade) => facade.dispose(),
        ),
        BlocProvider(
          create: (context) => notesCubitFactory(
            context.read<NotesFacade>(),
          )..startListening(),
        ),
        BlocProvider(
          create: (context) => notesLoaderBlocFactory(
            context.read<NotesFacade>(),
          )..add(const NotesLoadRequestedEvent()),
        ),
      ],
      child: child,
    );
  }
}
