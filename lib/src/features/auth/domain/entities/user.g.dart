// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  email: json['emailAddress'] as String,
  role: json['role'] == null ? 'FAMILY' : _roleFromJson(json['role']),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  phone: json['phone'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  residentId: (json['residentId'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'emailAddress': instance.email,
  'role': instance.role,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phone': instance.phone,
  'profileImageUrl': instance.profileImageUrl,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'residentId': instance.residentId,
};
