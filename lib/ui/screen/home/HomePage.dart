import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';
import 'package:moviedb_flutter/data/repository/MovieRepository.dart';
import 'package:moviedb_flutter/di/ServiceLocator.dart';

const ITEM_PER_PAGE = 20;

class _MyHomePageState extends State<MyHomePage> {
  final movieRepository = getIt.get<MovieRepository>();
  var listItem = <Movie>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  var currentPage = 0;
  var isLoading = false;
  var isLastPage = false;

  @override
  void initState() {
    super.initState();
    scaffoldKey = widget.scaffoldKey;
    firstLoad();
  }

  isFirst() {
    return currentPage == 0 && listItem.isEmpty;
  }

  firstLoad() {
    if (isFirst()) {
      isLoading = true;
      loadData(currentPage + 1);
    }
  }

  loadData(int page) {
    Stream.fromFuture(movieRepository.discoverMovies(page))
//        .doOnListen(onListen)
        .listen((response) => onSuccess(page, response.results),
            onError: onError);
  }

  getItemPerPage() {
    return ITEM_PER_PAGE;
  }

  onSuccess(int page, List<Movie> movies) {
    setState(() {
      currentPage = page;
      if (currentPage == 1) {
        listItem.clear();
        isLastPage = false;
      }

      listItem.addAll(movies);
      isLastPage = movies.length < getItemPerPage();

      isLoading = false;
    });
  }

  onError(e) {
    setState(() {
      isLoading = false;
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    });
  }

  onListen() {
    setState(() {});
  }

  Future<bool> loadMore() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    if (isLoading = true) return false;
    isLoading = true;
    loadData(currentPage + 1);
    return true;
  }

  Future<void> refresh() async {
    loadData(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RefreshIndicator(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: listItem.length,
              itemBuilder: (context, index) =>
                  MovieWidget(movie: listItem[index]),
            ),
            onRefresh: refresh));
  }
}

class MyHomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyHomePage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MovieWidget extends StatefulWidget {
  final Movie movie;

  const MovieWidget({Key key, @required this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieWidgetState();
}

class MovieWidgetState extends State<MovieWidget> {
  Movie _movie;
  final _movieRepository = getIt.get<MovieRepository>();
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _movie = widget.movie;
    _isLoading = true;
    _movieRepository
      ..isFavorite(_movie.id).then((b) => setState(() {
            _isLoading = false;
            _movie.isFavorite = b;
          }));
  }

  @override
  Widget build(BuildContext context) {
    final starIcon = _isLoading
        ? Container()
        : IconButton(
            onPressed: () {
              _onPressed();
            },
            icon: Icon(
              _movie.isFavorite ? Icons.star : Icons.star_border,
              color: Theme.of(context).accentColor,
            ),
          );

    final headerStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    );

    final titleText = Text(
      _movie.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: headerStyle,
    );

    final thumbnail = Container(
      child: Hero(
        child: _movie.posterPath == null
            ? Icon(
                Icons.error,
                color: Colors.redAccent.shade400,
              )
            : Image.network(
                "https://image.tmdb.org/t/p/w300${_movie.posterPath}",
                fit: BoxFit.cover,
              ),
        tag: _movie.id,
      ),
    );

    return GestureDetector(
      child: thumbnail,
      onTap: () {},
    );
  }

  void _onPressed() async {
    final isFavorite = !_movie.isFavorite;

    var res = isFavorite
        ? await _movieRepository.insertFavorite(_movie)
        : await _movieRepository.removeFavorite(_movie.id);
    debugPrint("${isFavorite ? "insert" : "delete"}, res = $res");

    setState(() {
      _movie.isFavorite = isFavorite;
    });
  }
}
