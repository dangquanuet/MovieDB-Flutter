import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T> {
  final isLoading = PublishSubject<bool>();
  final errorMessage = PublishSubject<String>();

  final noInternetConnectionEvent = PublishSubject<bool>();
  final connectTimeoutEvent = PublishSubject<bool>();

  final dataFetcher = PublishSubject<T>();

  void onLoadFail() {
    isLoading.sink.add(false);
  }

  void showError(String errorMessage) {
    this.errorMessage.sink.add(errorMessage);
  }

  void showLoading() {
    isLoading.sink.add(true);
  }

  void hideLoading() {
    isLoading.sink.add(false);
  }

  void dispose() {
    dataFetcher.close();
    isLoading.close();
    errorMessage.close();
    noInternetConnectionEvent.close();
    connectTimeoutEvent.close();
  }
}
