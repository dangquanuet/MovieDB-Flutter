import 'package:meta/meta.dart';

@immutable
abstract class MovieListEvent {}

class Load extends MovieListEvent {}

class Refresh extends MovieListEvent {}

class LoadMore extends MovieListEvent {}
