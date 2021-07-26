import 'package:json_annotation/json_annotation.dart';

import 'auth0_permissions.dart';
import 'auth0_roles.dart';

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
    required this.roles,
    required this.permissions,
    required this.availableAgents,
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

  @JsonKey(name: 'https://users.mjcoffee.app/roles')
  final List<Auth0Role> roles;

  @JsonKey(name: 'https://users.mjcoffee.app/permissions')
  final List<Auth0Permission> permissions;

  @JsonKey(name: 'https://employees.mjcoffee.app/id', defaultValue: [])
  final List<String> availableAgents;

  factory Auth0IdToken.fromJson(Map<String, dynamic> json) =>
      _$Auth0IdTokenFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0IdTokenToJson(this);
}
