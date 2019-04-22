import 'dart:async';

import 'package:moviedb_flutter/data/models/trailer_model.dart';
import 'package:moviedb_flutter/data/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  final _movieRepository = MovieRepository.getInstance();
  final _movieId = PublishSubject<String>();
  final _trailers = BehaviorSubject<Future<Trailer>>();

  Function(String) get fetchTrailersById => _movieId.sink.add;

  Observable<Future<Trailer>> get movieTrailers => _trailers.stream;

  MovieDetailBloc() {
    _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
      (Future<Trailer> trailer, String id, int index) {
        print(index);
        trailer = _movieRepository.getTrailer(movieId: id);
        return trailer;
      },
    );
  }
}
