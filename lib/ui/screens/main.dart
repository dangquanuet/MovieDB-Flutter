import 'package:flutter/material.dart';
import 'package:moviedb_flutter/ui/screens/favoritelist/favorite_list.dart';
import 'package:moviedb_flutter/ui/screens/home/home_page.dart';
import 'package:moviedb_flutter/ui/screens/movielist/movie_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie searcher',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('MovieDB'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.movie)),
                Tab(icon: Icon(Icons.favorite)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MyHomePage(scaffoldKey: _scaffoldKey),
              FavoritePage(scaffoldKey: _scaffoldKey),
            ],
          ),
        ),
      ),
    );
  }
}
