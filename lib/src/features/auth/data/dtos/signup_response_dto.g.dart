// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpResponseDto _$SignUpResponseDtoFromJson(Map<String, dynamic> json) =>
    _SignUpResponseDto(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SignUpResponseDtoToJson(_SignUpResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'roles': instance.roles,
    };
