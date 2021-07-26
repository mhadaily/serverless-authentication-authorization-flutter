// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0User _$Auth0UserFromJson(Map<String, dynamic> json) {
  return Auth0User(
    nickname: json['nickname'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    picture: json['picture'] as String,
    updatedAt: json['updated_at'] as String,
    sub: json['sub'] as String,
    streamChatUserToken:
        json['https://getstream.mjcoffee.app/user_token'] as String,
    permissions:
        (json['https://users.mjcoffee.app/permissions'] as List<dynamic>)
            .map((e) => Auth0Permission.fromJson(e as Map<String, dynamic>))
            .toList(),
    roles: (json['https://users.mjcoffee.app/roles'] as List<dynamic>)
        .map((e) => Auth0Role.fromJson(e as Map<String, dynamic>))
        .toList(),
    availableAgents:
        (json['https://employees.mjcoffee.app/id'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
  );
}

Map<String, dynamic> _$Auth0UserToJson(Auth0User instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'name': instance.name,
      'picture': instance.picture,
      'updated_at': instance.updatedAt,
      'sub': instance.sub,
      'email': instance.email,
      'https://getstream.mjcoffee.app/user_token': instance.streamChatUserToken,
      'https://users.mjcoffee.app/roles': instance.roles,
      'https://users.mjcoffee.app/permissions': instance.permissions,
      'https://employees.mjcoffee.app/id': instance.availableAgents,
    };
