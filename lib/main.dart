import 'package:flutter/material.dart';
import 'package:moviedb_flutter/di/ServiceLocator.dart';
import 'package:moviedb_flutter/ui/screen/movielistprovider/MovieLlistWidget.dart';

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
