import 'package:example/application/notes/notes_loading_blocs.dart';
import 'package:example/domain/notes/facades/notes_facade.dart';
import 'package:example/presentation/notes/notes_screen.dart';
import 'package:flutter/material.dart';

/// `convenient_architecture` usage example.
///
/// *This code won't work*, it's just an example.
///
/// Here you can see how to use:
/// - `response_parser` package
/// - reactive facades ([NotesFacade])
/// - action blocs ([NotesLoaderBloc])
/// - reactive facade consumer cubit ([NotesCubit])
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotesScreen(),
    );
  }
}
