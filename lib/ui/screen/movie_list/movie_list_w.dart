import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb_flutter/data/provider/movies.dart';

import '../../../data/model/movie.dart';

class MovieList extends HookConsumerWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesProvider(page: 1));
    return Center(
        child: movies.when(
      skipLoadingOnReload: true,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('An error occurred')),
      data: (movies) => ListView.builder(
        itemCount: movies.length + 1,
        itemBuilder: (_, index) {
          // Show a "load more" button at the bottom of the list.
          /*if (index == movies.length) {
            return Center(
              child: SizedBox.square(
                dimension: 36,
                child:
                    loadMoreSnapshot.connectionState == ConnectionState.waiting
                        ? const CircularProgressIndicator()
                        : const SizedBox(),
              ),
            );
          }*/

          return _MovieListTile(movie: movies[index]);
        },
      ),
    ));
  }
}

class _MovieListTile extends StatelessWidget {
  const _MovieListTile({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => openDetailPage(context, movie),
      title: Text(movie.title),
      subtitle: Wrap(
        spacing: 4,
        children: [
          Text('Rating: ${movie.voteAverage}'),
          Text('Release Date: ${movie.releaseDate}')
        ],
      ),
      trailing: Text('Popularity: ${movie.popularity}'),
    );
  }

  /// open detail page
  void openDetailPage(BuildContext context, Movie movie) {
    // todo open detail
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return buildMovieDetailWidget(movie);
      }),
    );*/
  }
}
