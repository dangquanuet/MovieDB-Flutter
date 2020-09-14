import 'package:flutter/foundation.dart';

abstract class BaseModel with ChangeNotifier {
  var isLoading = false;
  var errorMessage;

  final noInternetConnectionEvent = false;
  final connectTimeoutEvent = false;

  void onLoadFail(Exception exception) {
    isLoading = false;
    showError(exception.toString());
//    notifyListeners();
  }

  void showError(String message) {
    errorMessage = message;
//    notifyListeners();
  }

  void showLoading() {
    isLoading = true;
//    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
//    notifyListeners();
  }
}
