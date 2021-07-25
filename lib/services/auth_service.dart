import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mjcoffee/helpers/constants.dart';
import 'package:mjcoffee/models/auth0_id_token.dart';
import 'package:http/http.dart' as http;
import 'package:mjcoffee/models/auth0_user.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;
  AuthService._internal();

  final FlutterAppAuth appAuth = FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Auth0User? profile;
  Auth0IdToken? idToken;
  String? auth0AccessToken;

  Future<bool> init() async {
    final storedRefreshToken = await secureStorage.read(key: REFRESH_TOKEN_KEY);

    if (storedRefreshToken == null) {
      return false;
    }

    try {
      final TokenResponse? result = await appAuth.token(
        TokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: AUTH0_ISSUER,
          refreshToken: storedRefreshToken,
        ),
      );
      final String setResult = await _setLocalVariables(result);
      return setResult == 'Success';
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      // logOut() possibly
      return false;
    }
  }

  Future<String> login() async {
    try {
      final authorizationTokenRequest = AuthorizationTokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: 'https://$AUTH0_DOMAIN',
        scopes: ['openid', 'profile', 'offline_access', 'email'],
      );

      final AuthorizationTokenResponse? result =
          await appAuth.authorizeAndExchangeCode(
        authorizationTokenRequest,
      );

      return await _setLocalVariables(result);
    } on PlatformException {
      return 'User has cancelled or no internet!';
    } catch (e) {
      return 'Unkown Error!';
    }
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

  Future<Auth0User> getUserDetails(String accessToken) async {
    final url = Uri.https(
      AUTH0_DOMAIN,
      '/userinfo',
    );

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    print('getUserDetails ${response.body}');

    if (response.statusCode == 200) {
      return Auth0User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user details');
    }
  }

  Future<String> _setLocalVariables(result) async {
    final bool isValidResult =
        result != null && result.accessToken != null && result.idToken != null;

    if (isValidResult) {
      auth0AccessToken = result.accessToken;
      idToken = parseIdToken(result.idToken!);
      profile = await getUserDetails(result.accessToken!);

      await secureStorage.write(
        key: REFRESH_TOKEN_KEY,
        value: result.refreshToken,
      );

      return 'Success';
    } else {
      return 'Something is Wrong!';
    }
  }
}
