import 'package:flutter/material.dart';
import 'package:moviedb_flutter/screen/favorite_page.dart';
import 'package:moviedb_flutter/screen/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie searcher',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'NunitoSans',
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
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
