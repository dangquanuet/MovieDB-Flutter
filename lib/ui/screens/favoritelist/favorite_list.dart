import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/data/repositories/movie_repository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class FavoritePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const FavoritePage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _movieRepository = getIt.get<MovieRepository>();
  PublishSubject<String> _subject;
  List<Movie> _movies;
  bool _isLoading;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();

    _scaffoldKey = widget.scaffoldKey;

    _movies = <Movie>[];
    _isLoading = false;

    _subject = PublishSubject()
      ..stream
          .debounceTime(Duration(milliseconds: 300))
          .distinct()
          .map((query) => query.toLowerCase())
          .switchMap(searchMovie)
          .listen(onData, onError: onError);

    _subject.add('');
  }

  Stream<Iterable<Movie>> searchMovie(String query) {
    return Observable.fromFuture(_movieRepository.getFavoriteMovies())
        .map((list) => query.trim() == ''
            ? list
            : list.where((movie) => movie.title.toLowerCase().contains(query)))
        .doOnListen(() => setState(() => _isLoading = true));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextField(
              onChanged: (text) {
                _subject.add(text);
              },
            ),
          ),
          Flexible(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: _movies.map(
                        (m) => _movieItem(m),
                      ),
                    ).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  void onData(Iterable<Movie> movies) {
    setState(() {
      _movies = movies.toList();
      debugPrint("Search favorite...");
      _movies.forEach((m) => debugPrint(m.toString()));
      _isLoading = false;
    });
  }

  onError(e) {
    setState(() {
      _isLoading = false;
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    });
  }

  _onDismissed(String id) async {
    var res = await _movieRepository.removeFavorite(id);
    if (res != 0) {
      setState(() => _movies.removeWhere((m) => m.id == id));
    } else {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('An error occured')));
    }
    debugPrint("Remove favorite: $res");
  }

  Widget _movieItem(Movie m) {
    final headerStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    );
    final regularStyle = headerStyle.copyWith(
      fontSize: 9.0,
      color: Color(0xffb6b2df),
      fontWeight: FontWeight.w400,
    );
    final subHeaderStyle = headerStyle.copyWith(
      fontSize: 12.0,
    );

    final titleText = Text(
      m.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: headerStyle,
    );

    final thumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      alignment: AlignmentDirectional.centerStart,
      child: Hero(
        child: m.posterPath == null
            ? SizedBox(
                child: Center(
                  child: Container(
                    width: 92.0 * 2 / 3,
                    child: Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.redAccent.shade400,
                      ),
                    ),
                    decoration: BoxDecoration(color: Colors.black54),
                  ),
                ),
                width: 92.0,
              )
            : Image.network(
                "https://image.tmdb.org/t/p/w92${m.posterPath}",
                width: 92.0,
              ),
        tag: m.id,
      ),
    );
    final cardContent = Container(
      margin: EdgeInsets.only(left: 46.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 4.0),
          titleText,
          SizedBox(height: 8.0),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 32.0,
              color: Color(0xff00c6ff)),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_up,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      m.voteCount.toString(),
                      style: regularStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 8.0),
                    Center(
                      child: Text(
                        m.releaseDate.toString(),
                        style: regularStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
    final card = Container(
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 0.0),
          )
        ],
      ),
      child: cardContent,
    );
    return Dismissible(
      onDismissed: (_) {
        _onDismissed(m.id);
      },
      child: GestureDetector(
        child: Container(
          height: 132.0,
          margin: EdgeInsets.only(
            left: 4.0,
            right: 8.0,
            bottom: 12.0,
            top: 12.0,
          ),
          child: Stack(
            children: <Widget>[card, thumbnail],
          ),
        ),
        onTap: () {
//          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
//            return DetailPage(movie: m);
//          }));
        },
      ),
      key: Key(m.id),
    );
  }
}
