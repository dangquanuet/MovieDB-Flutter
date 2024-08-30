import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_info.dart';
import '../model/user.dart';

part 'app_prefs.g.dart';

@riverpod
Future<AppPrefs> appPrefs(AppPrefsRef ref) async {
  final AppPrefs appPrefs =
      _AppPrefsImpl(prefs: await SharedPreferences.getInstance());
  ref.keepAlive();
  return appPrefs;
}

abstract class AppPrefs {
  Future<void> setIsLoggedIn({required bool isLoggedIn});

  bool? getIsLoggedIn();

  Future<void> setUser({required User user});

  User? getUser();

  Future<void> setAuthInfo({required AuthInfo authInfo});

  AuthInfo? getAuthInfo();

  Future<void> clear();
}

class _AppPrefsImpl implements AppPrefs {
  late SharedPreferences prefs;

  _AppPrefsImpl({required SharedPreferences prefs}) {
    this.prefs = prefs;
  }

  final _keyIsLoggedIn = 'is_logged_in';

  Future<void> setIsLoggedIn({required bool isLoggedIn}) async {
    await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  bool? getIsLoggedIn() {
    return prefs.getBool(_keyIsLoggedIn);
  }

  final _keyUser = 'user';

  Future<void> setUser({required User user}) async {
    await prefs.setString(_keyUser, user.toJson() as String);
  }

  User? getUser() {
    final userJson = prefs.getString(_keyUser);
    if (userJson != null) {
      return User.fromJson(userJson as Map<String, dynamic>);
    }
    return null;
  }

  final _keyAuthInfo = 'auth_info';

  Future<void> setAuthInfo({required AuthInfo authInfo}) async {
    await prefs.setString(_keyAuthInfo, authInfo.toJson() as String);
  }

  AuthInfo? getAuthInfo() {
    final authInfoJson = prefs.getString(_keyAuthInfo);
    if (authInfoJson != null) {
      return AuthInfo.fromJson(authInfoJson as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> clear() async {
    await prefs.clear();
  }
}
