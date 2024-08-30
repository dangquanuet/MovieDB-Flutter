import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../local/app_prefs.dart';

part 'auth_interceptor.g.dart';

@riverpod
AuthInterceptor authInterceptor(AuthInterceptorRef ref) {
  final appPref = ref.watch(appPrefsProvider).requireValue;
  final authInterceptor = AuthInterceptor(appPref: appPref);
  ref.keepAlive();
  return authInterceptor;
}

class AuthInterceptor extends Interceptor {
  final AppPrefs appPref;

  AuthInterceptor({required this.appPref});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = options.extra["token"];
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }
}

/*class ApiProviderTokenInterceptor extends Interceptor {
  ApiProviderTokenInterceptor(this._config, this._tokenRepository);

  final AppConfig _config;
  final TokenRepository _tokenRepository;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (options.headers['requires-token'] == 'false') {
      // if the request doesn't need token, then just continue to the next
      // interceptor
      options.headers.remove('requiresToken'); //remove the auxiliary header
      return handler.next(options);
    }

    var token = _config.accessToken;
    if (token == null || _tokenRepository.tokenHasExpired(token)) {
      token = await _tokenRepository.loadAccessToken;
    }

    options.headers.addAll({'authorization': 'Bearer ${token!}'});
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // <-- here you can handle 401 response, which is not related to token expiration, globally to all requests
    return handler.next(err);
  }

  /// Tries to get accessToken from [AppConfig], localSecureStorage or Keycloak
  /// servers, and update them if necessary
  Future<String?> get loadAccessToken async {
    // get token from cache
    var accessToken = _config.accessToken;
    if (accessToken != null && !tokenHasExpired(accessToken)) {
      return accessToken;
    }
    // get token from secure storage
    accessToken = await LocalSecureStorageRepository.get(SecureStorageKeys.accessToken);
    if (accessToken != null && !tokenHasExpired(accessToken)) {
      // update cache
      _config.accessToken = accessToken;
      return accessToken;
    }
    // get token from Keycloak server
    final keycloakTokenResponse = await _accessTokenFromKeycloakServer;
    accessToken = keycloakTokenResponse.accessToken;
    final refreshToken = keycloakTokenResponse.refreshToken;
    if (!tokenHasExpired(accessToken) && !tokenHasExpired(refreshToken)) {
      // update secure storage
      await Future.wait([
        LocalSecureStorageRepository.update(
          SecureStorageKeys.accessToken,
          accessToken,
        ),
        LocalSecureStorageRepository.update(
          SecureStorageKeys.refreshToken,
          refreshToken,
        )
      ]);
      // update cache
      _config.accessToken = accessToken;
      return accessToken;
    }
    return null;
  }

  bool tokenHasExpired(String? token) {
    if (token == null) return true;
    return Jwt.isExpired(token);
  }
}*/
