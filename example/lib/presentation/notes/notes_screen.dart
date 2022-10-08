import 'package:example/application/notes/notes_loading_blocs.dart';
import 'package:example/presentation/notes/notes_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotesProviders(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: BlocConsumer<NotesLoaderBloc, NotesLoaderState>(
          listener: _handleNotesLoaderState,
          builder: (context, loadingState) {
            return BlocBuilder<NotesCubit, NotesCubitState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CupertinoActivityIndicator()),
                  loaded: (loaded) {
                    return ListView.builder(
                      itemCount: loaded.data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == loaded.data.length) {
                          final loadInProgress = loadingState.maybeWhen(
                            orElse: () => false,
                            inProgress: () => true,
                          );
                          if (loaded.canLoadMore) {
                            _loadMore(context);
                          }
                          if (loaded.canLoadMore || loadInProgress) {
                            return const ListTile(
                              title: Text('Loading...'),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                        final note = loaded.data[index];

                        return ListTile(
                          title: Text('$note #'),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _loadMore(BuildContext context) {
    context.read<NotesLoaderBloc>().add(const NotesLoadRequestedEvent());
  }

  void _handleNotesLoaderState(BuildContext context, NotesLoaderState state) {
    state.whenOrNull(
      failure: (failure) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(failure.errorMessage),
        ),
      ),
    );
  }
}
