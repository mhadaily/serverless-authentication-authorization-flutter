// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_permissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0Permission _$Auth0PermissionFromJson(Map<String, dynamic> json) {
  return Auth0Permission(
    permissionName: json['permission_name'] as String,
    description: json['description'] as String,
    resourceServerName: json['resource_server_name'] as String,
    resourceServerIdentifier: json['resource_server_identifier'] as String,
    sources: (json['sources'] as List<dynamic>)
        .map((e) => Auth0PermissionsSource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$Auth0PermissionToJson(Auth0Permission instance) =>
    <String, dynamic>{
      'permission_name': instance.permissionName,
      'description': instance.description,
      'resource_server_name': instance.resourceServerName,
      'resource_server_identifier': instance.resourceServerIdentifier,
      'sources': instance.sources,
    };

Auth0PermissionsSource _$Auth0PermissionsSourceFromJson(
    Map<String, dynamic> json) {
  return Auth0PermissionsSource(
    sourceId: json['source_id'] as String,
    sourceName: json['source_name'] as String,
    sourceType: json['source_type'] as String,
  );
}

Map<String, dynamic> _$Auth0PermissionsSourceToJson(
        Auth0PermissionsSource instance) =>
    <String, dynamic>{
      'source_id': instance.sourceId,
      'source_name': instance.sourceName,
      'source_type': instance.sourceType,
    };
