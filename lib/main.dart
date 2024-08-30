import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb_flutter/ui/screen/movie_list/movie_list.dart';

import 'util/provider_observer.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // We preserve the native splash screen, which will then removed once the main
  // app is inserted to the widget tree.
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // HttpOverrides.global = _HttpOverrides();
  runApp(app());
}

Widget app() {
  return ProviderScope(
    observers: [AppProviderObserver()],
    child: MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: getBody(),
      ),
    ),
  );
}

Widget devicePreviewApp() {
  return DevicePreview(
    enabled: true,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => ProviderScope(
      observers: [AppProviderObserver()],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          body: getBody(),
        ),
      ),
    ),
  );
}

Widget getBody() {
  return MovieList();
}
