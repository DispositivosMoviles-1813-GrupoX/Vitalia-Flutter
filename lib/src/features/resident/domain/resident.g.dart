// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resident _$ResidentFromJson(Map<String, dynamic> json) => _Resident(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  dni: json['dni'] as String,
  photoUrl: json['photoUrl'] as String?,
  status: json['status'] as String?,
  emergencyContact: json['emergencyContact'] as String?,
  allergies: json['allergies'] as String?,
  conditions: json['conditions'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$ResidentToJson(_Resident instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'dni': instance.dni,
  'photoUrl': instance.photoUrl,
  'status': instance.status,
  'emergencyContact': instance.emergencyContact,
  'allergies': instance.allergies,
  'conditions': instance.conditions,
  'address': instance.address,
};
