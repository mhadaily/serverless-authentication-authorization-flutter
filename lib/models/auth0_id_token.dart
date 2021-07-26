import 'package:json_annotation/json_annotation.dart';

part 'auth0_id_token.g.dart';

@JsonSerializable()
class Auth0IdToken {
  Auth0IdToken({
    required this.nickname,
    required this.name,
    required this.email,
    required this.picture,
    required this.updatedAt,
    required this.iss,
    required this.sub,
    required this.aud,
    required this.iat,
    required this.exp,
    this.authTime,
    required this.streamChatUserToken,
  });

  final String nickname;
  final String name;
  final String picture;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  final String iss;

  // userID getter to understand it easier
  String get userId => sub;
  final String sub;

  final String aud;
  final String email;
  final int iat;
  final int exp;

  @JsonKey(name: 'auth_time')
  final int? authTime;

  @JsonKey(name: 'https://getstream.mjcoffee.app/user_token')
  final String streamChatUserToken;

  factory Auth0IdToken.fromJson(Map<String, dynamic> json) =>
      _$Auth0IdTokenFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0IdTokenToJson(this);
}
