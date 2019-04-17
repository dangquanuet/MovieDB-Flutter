import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T> {
  final dataFetcher = PublishSubject<T>();

  void dispose() {
    dataFetcher.close();
  }
}
