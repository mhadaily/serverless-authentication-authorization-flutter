import 'package:json_annotation/json_annotation.dart';

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
  });
  final String nickname;
  final String name;
  final String picture;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  // userID getter to understand it easier
  String get userId => sub;
  final String sub;

  final String email;

  factory Auth0User.fromJson(Map<String, dynamic> json) =>
      _$Auth0UserFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0UserToJson(this);
}
