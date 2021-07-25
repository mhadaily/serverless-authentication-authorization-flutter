import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mjcoffee/helpers/constants.dart';
import 'package:mjcoffee/models/auth0_id_token.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;
  AuthService._internal();

  final FlutterAppAuth appAuth = FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  login() async {
    // construct Authorization Token Request
    final authorizationTokenRequest = AuthorizationTokenRequest(
      AUTH0_CLIENT_ID,
      AUTH0_REDIRECT_URI,
      issuer: 'https://$AUTH0_DOMAIN',
      scopes: ['openid', 'profile', 'offline_access', 'email'],
    );

    // Call code exchange endpoint to get an authorization token
    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      authorizationTokenRequest,
    );

    print(result);
  }

  Auth0IdToken parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    final Map<String, dynamic> json = jsonDecode(
      utf8.decode(
        base64Url.decode(
          base64Url.normalize(parts[1]),
        ),
      ),
    );

    return Auth0IdToken.fromJson(json);
  }
}
