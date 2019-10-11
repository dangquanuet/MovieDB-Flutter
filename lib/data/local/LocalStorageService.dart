import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const ACCESS_TOKEN = "ACCESS_TOKEN";

  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<bool> saveAccessToken(String accessToken) {
    return _preferences.setString(ACCESS_TOKEN, accessToken);
  }

  String getAccessToken() {
    return _preferences.getString(ACCESS_TOKEN);
  }
}
