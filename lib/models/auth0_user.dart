import 'package:json_annotation/json_annotation.dart';

import 'auth0_permissions.dart';
import 'auth0_roles.dart';

part 'auth0_user.g.dart';

@JsonSerializable()
class Auth0User {
  Auth0User({
    required this.nickname,
    required this.name,
    required this.email,
    required this.picture,
    required this.updatedAt,
    required this.sub,
    required this.streamChatUserToken,
    required this.permissions,
    required this.roles,
    required this.availableAgents,
  });

  bool get hasImage => picture.isNotEmpty;
  bool can(String permission) => permissions
      .where(
        (p) => p.permissionName == permission,
      )
      .isNotEmpty;

  get isAdmin => roles.where((role) => role.name == Role.Admin).isNotEmpty;
  get isEmployee =>
      roles.where((role) => role.name == Role.Employee).isNotEmpty;
  get isCustomer =>
      roles.where((role) => role.name == Role.Customer).isNotEmpty;

  final String nickname;
  final String name;
  final String picture;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  // userID getter to understand it easier
  // GetStream doesn't not accept | in the userId, so we need to remove it
  String get id => sub.split('|').join('');
  final String sub;

  final String email;

  @JsonKey(name: 'https://getstream.mjcoffee.app/user_token')
  final String streamChatUserToken;

  @JsonKey(name: 'https://users.mjcoffee.app/roles')
  final List<Auth0Role> roles;

  @JsonKey(name: 'https://users.mjcoffee.app/permissions')
  final List<Auth0Permission> permissions;

  @JsonKey(name: 'https://employees.mjcoffee.app/id', defaultValue: [])
  final List<String> availableAgents;

  factory Auth0User.fromJson(Map<String, dynamic> json) =>
      _$Auth0UserFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0UserToJson(this);
}
