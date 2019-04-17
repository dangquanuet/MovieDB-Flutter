import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T> {
  var isLoading = false;
  var errorMessage;

  final noInternetConnectionEvent = false;
  final connectTimeoutEvent = false;

  final dataFetcher = PublishSubject<T>();

  void onLoadFail() {
    isLoading = false;
  }

  void showError(String message) {
    errorMessage = message;
  }

  void showLoading() {
    isLoading = true;
  }

  void hideLoading() {
    isLoading = false;
  }

  void dispose() {
    dataFetcher.close();
  }
}
