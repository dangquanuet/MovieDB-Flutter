import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static const ACCESS_TOKEN = "ACCESS_TOKEN";

  SharedPreferences _preferences;

  AppPrefs() {
    getPreferences();
  }

  Future<SharedPreferences> getPreferences() async {
    return _preferences ??= await SharedPreferences.getInstance();
  }

  Future<bool> setAccessToken(String accessToken) async {
    return _preferences.setString(ACCESS_TOKEN, accessToken);
  }

  String getAccessToken() {
    return _preferences.getString(ACCESS_TOKEN);
  }
}
