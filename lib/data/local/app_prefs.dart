import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_prefs.g.dart';

@riverpod
Future<AppPrefs> appPrefs(AppPrefsRef ref) async {
  return AppPrefs(prefs: await SharedPreferences.getInstance());
}

class AppPrefs {
  late SharedPreferences prefs;

  AppPrefs({required SharedPreferences prefs}) {
    this.prefs = prefs;
  }

  final _keyIsLoggedIn = 'is_logged_in';

  Future<void> setIsLoggedIn({required bool isLoggedIn}) async {
    await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  bool? getIsLoggedIn() {
    return prefs.getBool(_keyIsLoggedIn);
  }

  Future<void> clear() async {
    await prefs.clear();
  }
}
