import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';
import 'package:moviedb_flutter/ui/screen/moviedetailprovider/MovieDetailWidget.dart';
import 'package:moviedb_flutter/ui/widget/platform_progress.dart';
import 'package:moviedb_flutter/util/utils.dart';
import 'package:provider/provider.dart';

import 'movie_list_model.dart';

/// build MovieListWidget with ChangeNotifierProvider
Widget buildMovieListProvider() {
  return ChangeNotifierProvider<MovieListModel>(
    create: (context) => MovieListModel(),
    child: MovieListWidget(),
  );
}

class MovieListWidget extends StatelessWidget {
  MovieListModel movieListModel;

  @override
  Widget build(BuildContext context) {
    movieListModel = Provider.of<MovieListModel>(context);
    movieListModel.firstLoad();
    return buildList(movieListModel.itemList);
  }

  Widget buildList(List<Movie> movieList) {
    if (movieListModel.isLoading) {
      return Center(child: PlatformProgress());
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: movieListModel.onRefreshListener,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: movieList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    movieListModel.onScrollListener(index);
                    return buildMovieItem(context, movieList[index]);
                  }),
            ),
          ),
          if (movieListModel.isLoadMore) PlatformProgress()
        ],
      );
    }
  }

  Widget buildMovieItem(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () => openDetailPage(context, movie),
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
              child: Image.network(
            getSmallImageUrl(movie.posterPath),
            alignment: Alignment.center,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(6),
              decoration:
                  BoxDecoration(color: Colors.grey[900].withOpacity(0.5)),
              child: Text(
                movie.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
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
