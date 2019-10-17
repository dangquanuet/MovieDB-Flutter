import 'package:flutter/material.dart';
import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/ui/screens/moviedetail/movie_detail_widget.dart';
import 'package:moviedb_flutter/ui/screens/movielist/movie_list_bloc.dart';
import 'package:moviedb_flutter/ui/widgets/platform_progress.dart';
import 'package:moviedb_flutter/utils/utils.dart';
import 'package:provider/provider.dart';

/// build MovieListWidget with ChangeNotifierProvider
Widget buildMovieListWidget() {
  return ChangeNotifierProvider<MovieListBloc>(
    builder: (context) => MovieListBloc(),
    child: MovieListWidget(),
  );
}

class MovieListWidget extends StatelessWidget {
  MovieListBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<MovieListBloc>(context);
    bloc.firstLoad();
    return buildList(bloc.itemList);
  }

  Widget buildList(List<Movie> movieList) {
    if (bloc.isLoading) {
      return Center(child: PlatformProgress());
    } else {
      return RefreshIndicator(
        onRefresh: bloc.onRefreshListener,
        child: GridView.builder(
            itemCount: movieList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              bloc.onScrollListener(index);
              var movie = movieList[index];
              return GestureDetector(
                onTap: () => openDetailPage(context, movie),
                child: GridTile(
                  child: Image.network(
                    getSmallImageUrl(movie.posterPath),
                  ),
                  footer: Container(
                    decoration:
                        BoxDecoration(color: Colors.grey[900].withOpacity(0.5)),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        movie.title,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
    }
  }

  /// open detail page
  void openDetailPage(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return buildMovieDetailWidget(movie);
      }),
    );
  }
}
