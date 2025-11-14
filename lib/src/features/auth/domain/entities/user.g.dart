// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  role: json['role'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  profileImageUrl: json['profileImageUrl'] as String?,
  residentId: (json['residentId'] as num?)?.toInt(),
  dateOfBirth: const DateOnlyConverter().fromJson(
    json['dateOfBirth'] as String,
  ),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'role': instance.role,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'profileImageUrl': instance.profileImageUrl,
  'residentId': instance.residentId,
  'dateOfBirth': const DateOnlyConverter().toJson(instance.dateOfBirth),
};
