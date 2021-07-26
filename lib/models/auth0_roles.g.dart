// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0Role _$Auth0RoleFromJson(Map<String, dynamic> json) {
  return Auth0Role(
    id: json['id'] as String,
    name: _$enumDecode(_$RoleEnumMap, json['name']),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$Auth0RoleToJson(Auth0Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': _$RoleEnumMap[instance.name],
      'description': instance.description,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$RoleEnumMap = {
  Role.Employee: 'Employee',
  Role.Admin: 'Admin',
  Role.Customer: 'Customer',
};
