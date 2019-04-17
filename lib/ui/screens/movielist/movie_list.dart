import 'package:flutter/material.dart';
import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';
import 'package:moviedb_flutter/ui/base/base_state.dart';
import 'package:moviedb_flutter/ui/screens/moviedetail/movie_detail.dart';
import 'package:moviedb_flutter/ui/screens/moviedetail/movie_detail_bloc_provider.dart';
import 'package:moviedb_flutter/ui/screens/movielist/movie_list_bloc.dart';
import 'package:moviedb_flutter/ui/widgets/platform_progress.dart';

class MovieListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListWidgetState();
  }
}

class MovieListWidgetState extends BaseState<MovieListWidget, MovieListBloc> {
  @override
  var bloc = MovieListBloc();

  @override
  void initState() {
    super.initState();
    bloc.firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.dataFetcher.stream,
        builder: (context, AsyncSnapshot<MovieListResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: PlatformProgress());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MovieListResponse> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        });
  }

  openDetailPage(MovieListResponse data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetailBlocProvider(
          child: MovieDetail(
            title: data.results[index].title,
            posterUrl: data.results[index].backdropPath,
            description: data.results[index].overview,
            releaseDate: data.results[index].releaseDate,
            voteAverage: data.results[index].voteAverage.toString(),
            movieId: data.results[index].id,
          ),
        );
      }),
    );
  }
}
