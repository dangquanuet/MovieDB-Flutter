import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb_flutter/data/provider/movies.dart';
import 'package:moviedb_flutter/ui/screen/movie_list/movie_list_w.dart';

import 'util/provider_observer.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // We preserve the native splash screen, which will then removed once the main
  // app is inserted to the widget tree.
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // HttpOverrides.global = _HttpOverrides();

  runApp(ProviderScope(
    observers: [AppProviderObserver()],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(body: MovieList()),
    );
  }
}

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text("Hello"),
    );
  }
}
