import 'package:flutter/material.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/screens/movielistprovider/movie_llist_widget.dart';

void main() {
  // setup dependency injection
  setupDI();

  // run app
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(body: buildMovieListProvider()),
    );
  }
}
